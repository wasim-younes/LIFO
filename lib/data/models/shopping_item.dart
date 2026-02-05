import 'package:flutter/material.dart';

class ShoppingItem {
  final int? id;
  final String name;
  final String? description;
  final double defaultQuantity;
  final String unit;
  final String? category;
  final String? brand;
  final double? estimatedPrice;
  final String? size;
  final String? color;
  final String? imagePath;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime? lastUsed;
  final int usageCount;

  ShoppingItem({
    this.id,
    required this.name,
    this.description,
    this.defaultQuantity = 1.0,
    this.unit = 'pcs',
    this.category,
    this.brand,
    this.estimatedPrice,
    this.size,
    this.color,
    this.imagePath,
    this.isFavorite = false,
    DateTime? createdAt,
    this.lastUsed,
    this.usageCount = 0,
  }) : createdAt = createdAt ?? DateTime.now();

  // Factory constructor from Drift data
  factory ShoppingItem.fromData(dynamic data) {
    return ShoppingItem(
      id: data.id,
      name: data.name,
      description: data.description,
      defaultQuantity: data.defaultQuantity,
      unit: data.unit,
      category: data.category,
      brand: data.brand,
      estimatedPrice: data.estimatedPrice,
      size: data.size,
      color: data.color,
      imagePath: data.imagePath,
      isFavorite: data.isFavorite,
      createdAt: data.createdAt,
      lastUsed: data.lastUsed,
      usageCount: data.usageCount,
    );
  }

  // Factory constructor from Map
  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'],
      name: map['name'] ?? '',
      description: map['description'],
      defaultQuantity: (map['defaultQuantity'] ?? 1.0).toDouble(),
      unit: map['unit'] ?? 'pcs',
      category: map['category'],
      brand: map['brand'],
      estimatedPrice: map['estimatedPrice']?.toDouble(),
      size: map['size'],
      color: map['color'],
      imagePath: map['imagePath'],
      isFavorite: map['isFavorite'] ?? false,
      createdAt: map['createdAt'] is DateTime
          ? map['createdAt'] as DateTime
          : DateTime.parse(map['createdAt'].toString()),
      lastUsed: map['lastUsed'] != null
          ? (map['lastUsed'] is DateTime
              ? map['lastUsed'] as DateTime
              : DateTime.parse(map['lastUsed'].toString()))
          : null,
      usageCount: map['usageCount'] ?? 0,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'defaultQuantity': defaultQuantity,
      'unit': unit,
      if (category != null) 'category': category,
      if (brand != null) 'brand': brand,
      if (estimatedPrice != null) 'estimatedPrice': estimatedPrice,
      if (size != null) 'size': size,
      if (color != null) 'color': color,
      if (imagePath != null) 'imagePath': imagePath,
      'isFavorite': isFavorite,
      'createdAt': createdAt.toIso8601String(),
      if (lastUsed != null) 'lastUsed': lastUsed!.toIso8601String(),
      'usageCount': usageCount,
    };
  }

  // Copy with for updates
  ShoppingItem copyWith({
    int? id,
    String? name,
    String? description,
    double? defaultQuantity,
    String? unit,
    String? category,
    String? brand,
    double? estimatedPrice,
    String? size,
    String? color,
    String? imagePath,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? lastUsed,
    int? usageCount,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      defaultQuantity: defaultQuantity ?? this.defaultQuantity,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      size: size ?? this.size,
      color: color ?? this.color,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      lastUsed: lastUsed ?? this.lastUsed,
      usageCount: usageCount ?? this.usageCount,
    );
  }

  // Helper methods
  Color? get colorValue {
    if (color == null) return null;
    try {
      return Color(int.parse(color!));
    } catch (e) {
      return null;
    }
  }

  String get priceString {
    if (estimatedPrice == null) return 'No price';
    return '\$${estimatedPrice!.toStringAsFixed(2)}';
  }

  String get quantityString {
    return '$defaultQuantity $unit';
  }

  bool get hasImage => imagePath != null && imagePath!.isNotEmpty;

  @override
  String toString() {
    return 'ShoppingItem(id: $id, name: $name, category: $category, price: $estimatedPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShoppingItem &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.defaultQuantity == defaultQuantity &&
        other.unit == unit &&
        other.category == category &&
        other.brand == brand &&
        other.estimatedPrice == estimatedPrice &&
        other.size == size &&
        other.color == color &&
        other.imagePath == imagePath &&
        other.isFavorite == isFavorite &&
        other.createdAt == createdAt &&
        other.lastUsed == lastUsed &&
        other.usageCount == usageCount;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      description,
      defaultQuantity,
      unit,
      category,
      brand,
      estimatedPrice,
      size,
      color,
      imagePath,
      isFavorite,
      createdAt,
      lastUsed,
      usageCount,
    );
  }
}
