import 'package:drift/drift.dart';
import 'package:life_organizer_app/data/database/app_database.dart';
import 'package:life_organizer_app/data/models/shopping_item.dart';

class ShoppingRepository {
  final AppDatabase db;

  ShoppingRepository(this.db);

  // ========== CREATE ==========
  Future<int> createShoppingItem(ShoppingItem item) async {
    try {
      final id = await db.into(db.shoppingItem).insert(
            ShoppingItemCompanion.insert(
              name: item.name,
              description: Value(item.description),
              defaultQuantity: Value(item.defaultQuantity),
              unit: Value(item.unit),
              category: Value(item.category),
              brand: Value(item.brand),
              estimatedPrice: Value(item.estimatedPrice),
              size: Value(item.size),
              color: Value(item.color),
              imagePath: Value(item.imagePath),
              isFavorite: Value(item.isFavorite),
              createdAt: item.createdAt,
              lastUsed: Value(item.lastUsed),
              usageCount: Value(item.usageCount),
            ),
          );
      return id;
    } catch (e) {
      print('❌ Error creating shopping item: $e');
      rethrow;
    }
  }

  // ========== READ ==========
  Future<List<ShoppingItem>> getAllShoppingItems() async {
    try {
      final items = await db.select(db.shoppingItem).get();
      return items.map(ShoppingItem.fromData).toList();
    } catch (e) {
      print('❌ Error getting all items: $e');
      return [];
    }
  }

  Future<ShoppingItem?> getShoppingItemById(int id) async {
    try {
      final item = await (db.select(db.shoppingItem)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();

      return item != null ? ShoppingItem.fromData(item) : null;
    } catch (e) {
      print('❌ Error getting item by ID: $e');
      return null;
    }
  }

  // ========== UPDATE ==========
  Future<void> updateShoppingItem(ShoppingItem item) async {
    try {
      await db.update(db.shoppingItem).replace(
            ShoppingItemCompanion(
              id: Value(item.id!),
              name: Value(item.name),
              description: Value(item.description),
              defaultQuantity: Value(item.defaultQuantity),
              unit: Value(item.unit),
              category: Value(item.category),
              brand: Value(item.brand),
              estimatedPrice: Value(item.estimatedPrice),
              size: Value(item.size),
              color: Value(item.color),
              imagePath: Value(item.imagePath),
              isFavorite: Value(item.isFavorite),
              createdAt: Value(item.createdAt),
              lastUsed: Value(item.lastUsed),
              usageCount: Value(item.usageCount),
            ),
          );
    } catch (e) {
      print('❌ Error updating item: $e');
      rethrow;
    }
  }

  // ========== DELETE ==========
  Future<void> deleteShoppingItem(int id) async {
    try {
      await (db.delete(db.shoppingItem)..where((t) => t.id.equals(id))).go();
    } catch (e) {
      print('❌ Error deleting item: $e');
      rethrow;
    }
  }

  // ========== SEARCH ==========
  Future<List<ShoppingItem>> searchShoppingItems(String query) async {
    try {
      final items = await (db.select(db.shoppingItem)
            ..where(
                (t) => t.name.like('%$query%') | t.description.like('%$query%'))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.usageCount, mode: OrderingMode.desc)
            ]))
          .get();

      return items.map(ShoppingItem.fromData).toList();
    } catch (e) {
      print('❌ Error searching items: $e');
      return [];
    }
  }

  Future<List<ShoppingItem>> getFavoriteItems() async {
    try {
      final items = await (db.select(db.shoppingItem)
            ..where((t) => t.isFavorite.equals(true))
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.lastUsed, mode: OrderingMode.desc)
            ]))
          .get();

      return items.map(ShoppingItem.fromData).toList();
    } catch (e) {
      print('❌ Error getting favorites: $e');
      return [];
    }
  }

  Future<List<ShoppingItem>> getItemsByCategory(String category) async {
    try {
      final items = await (db.select(db.shoppingItem)
            ..where((t) => t.category.equals(category))
            ..orderBy([(t) => OrderingTerm(expression: t.name)]))
          .get();

      return items.map(ShoppingItem.fromData).toList();
    } catch (e) {
      print('❌ Error getting items by category: $e');
      return [];
    }
  }

  // ========== UTILITIES ==========
  Future<void> markItemAsUsed(int id) async {
    try {
      final item = await getShoppingItemById(id);
      if (item != null) {
        final updated = item.copyWith(
          lastUsed: DateTime.now(),
          usageCount: item.usageCount + 1,
        );
        await updateShoppingItem(updated);
      }
    } catch (e) {
      print('❌ Error marking item as used: $e');
    }
  }

  Future<void> toggleFavorite(int id) async {
    try {
      final item = await getShoppingItemById(id);
      if (item != null) {
        final updated = item.copyWith(isFavorite: !item.isFavorite);
        await updateShoppingItem(updated);
      }
    } catch (e) {
      print('❌ Error toggling favorite: $e');
    }
  }

  Future<List<String>> getAllCategories() async {
    try {
      final items = await db.select(db.shoppingItem).get();
      final categories = items
          .map((item) => item.category)
          .where((category) => category != null)
          .map((category) => category!)
          .toSet()
          .toList();

      return categories..sort();
    } catch (e) {
      print('❌ Error getting categories: $e');
      return [];
    }
  }

  Future<List<ShoppingItem>> getMostUsedItems({int limit = 10}) async {
    try {
      final items = await (db.select(db.shoppingItem)
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.usageCount, mode: OrderingMode.desc)
            ])
            ..limit(limit))
          .get();

      return items.map(ShoppingItem.fromData).toList();
    } catch (e) {
      print('❌ Error getting most used items: $e');
      return [];
    }
  }

  Future<List<ShoppingItem>> getRecentlyUsedItems({int limit = 10}) async {
    try {
      final items = await (db.select(db.shoppingItem)
            ..where((t) => t.lastUsed.isNotNull())
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.lastUsed, mode: OrderingMode.desc)
            ])
            ..limit(limit))
          .get();

      return items.map(ShoppingItem.fromData).toList();
    } catch (e) {
      print('❌ Error getting recently used items: $e');
      return [];
    }
  }
}
