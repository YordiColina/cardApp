import '../item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
  Future<void> addItem(Item itemData);
  Future<void> updateItem(Item itemData);
  Future<void> deleteItem(String id);
}