import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/item_data/item.dart';
import '../../domain/usecases/add_item_data_usecase.dart';
import '../../domain/usecases/delete_item_data_usecase.dart';
import '../../domain/usecases/get_items_list_usecase.dart';
import '../../domain/usecases/update_item_data_usecase.dart';


class ItemNotifier extends StateNotifier<List<Item>> {
  final GetItemsUseCase _getItemsDataUseCase;
  final AddItemDataUseCase _addItemDataUseCase;
  final UpdateItemDataUseCase _updateItemDataUseCase;
  final DeleteItemDataUseCase _deleteItemDataUseCase;

  ItemNotifier(
      this._getItemsDataUseCase,
      this._addItemDataUseCase,
      this._updateItemDataUseCase,
      this._deleteItemDataUseCase,
      ) : super([]);

  Future<void> fetchItems() async {
    final items = await _getItemsDataUseCase.execute();
    state = items;
  }

  Future<void> addItem(Item item) async {
    await _addItemDataUseCase.execute(item);
    await fetchItems(); // Actualiza la lista después de añadir
  }

  Future<void> updateItem(Item item) async {
    await _updateItemDataUseCase.execute(item);
    await fetchItems(); // Actualiza la lista después de editar
  }

  Future<void> deleteItem(String id) async {
    await _deleteItemDataUseCase.execute(id);
    await fetchItems(); // Actualiza la lista después de borrar
  }
}
