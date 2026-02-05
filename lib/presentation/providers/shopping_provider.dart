import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:life_organizer_app/data/models/shopping_item.dart';
import 'package:life_organizer_app/data/repositories/shopping_repository.dart';
import 'package:life_organizer_app/presentation/providers/app_providers.dart';

// All shopping items
final allShoppingItemsProvider =
    FutureProvider.autoDispose<List<ShoppingItem>>((ref) async {
  final repository = ref.watch(shoppingRepositoryProvider);
  return await repository.getAllShoppingItems();
});

// Favorite items
final favoriteItemsProvider =
    FutureProvider.autoDispose<List<ShoppingItem>>((ref) async {
  final repository = ref.watch(shoppingRepositoryProvider);
  return await repository.getFavoriteItems();
});

// Categories
final categoriesProvider =
    FutureProvider.autoDispose<List<String>>((ref) async {
  final repository = ref.watch(shoppingRepositoryProvider);
  return await repository.getAllCategories();
});

// Search state
final shoppingSearchProvider = StateProvider<String>((ref) => '');

// Search results
final searchedItemsProvider = FutureProvider.autoDispose
    .family<List<ShoppingItem>, String>((ref, query) async {
  if (query.isEmpty) return [];
  final repository = ref.watch(shoppingRepositoryProvider);
  return await repository.searchShoppingItems(query);
});

// Shopping operations
final shoppingOperationsProvider = Provider<ShoppingOperations>((ref) {
  final repository = ref.watch(shoppingRepositoryProvider);
  return ShoppingOperations(repository);
});

class ShoppingOperations {
  final ShoppingRepository _repository;

  ShoppingOperations(this._repository);

  Future<int> createItem(ShoppingItem item) async {
    return await _repository.createShoppingItem(item);
  }

  Future<void> updateItem(ShoppingItem item) async {
    return await _repository.updateShoppingItem(item);
  }

  Future<void> deleteItem(int id) async {
    return await _repository.deleteShoppingItem(id);
  }

  Future<void> toggleFavorite(int id) async {
    return await _repository.toggleFavorite(id);
  }

  Future<void> markAsUsed(int id) async {
    return await _repository.markItemAsUsed(id);
  }
}
