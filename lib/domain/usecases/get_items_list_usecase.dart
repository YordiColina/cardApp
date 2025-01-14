import '../models/item_data/item.dart';
import '../models/item_data/repository/item_repository.dart';

class GetItemsUseCase {
  final ItemRepository _itemDataRepository;

  GetItemsUseCase(this._itemDataRepository);

  Future<List<Item>> execute() {
    return _itemDataRepository.getItems();
  }
}