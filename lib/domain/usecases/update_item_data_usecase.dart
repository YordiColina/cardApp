import '../models/item_data/item.dart';
import '../models/item_data/repository/item_repository.dart';

class UpdateItemDataUseCase {
  final ItemRepository _itemRepository;

  UpdateItemDataUseCase(this._itemRepository);

  Future<void> execute(Item item) async {
    return _itemRepository.updateItem(item);
  }
}