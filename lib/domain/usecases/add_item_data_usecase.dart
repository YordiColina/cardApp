import '../models/item_data/item.dart';
import '../models/item_data/repository/item_repository.dart';

class AddItemDataUseCase {
  final ItemRepository _itemRepository;

  AddItemDataUseCase(this._itemRepository);

  Future<void> execute(Item item) async {
    return _itemRepository.addItem(item);
  }
}