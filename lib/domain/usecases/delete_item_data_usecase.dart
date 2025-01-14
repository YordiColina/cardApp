import '../models/item_data/repository/item_repository.dart';

class DeleteItemDataUseCase {
  final ItemRepository _itemRepository;

  DeleteItemDataUseCase(this._itemRepository);

  Future<void> execute(String id) async {
    return _itemRepository.deleteItem(id);
  }
}