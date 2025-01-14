import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/add_item_data_usecase.dart';

import '../../domain/usecases/delete_item_data_usecase.dart';
import '../../domain/usecases/get_items_list_usecase.dart';
import '../../domain/usecases/update_item_data_usecase.dart';
import 'item_repository_provider.dart';


final addItemUseCaseProvider = Provider((ref) {
  final repository = ref.read(itemRepositoryProvider);
  return AddItemDataUseCase(repository);
});

final getItemsUseCaseProvider = Provider((ref) {
  final repository = ref.read(itemRepositoryProvider);
  return GetItemsUseCase(repository);
});

final updateItemUseCaseProvider = Provider((ref) {
  final repository = ref.read(itemRepositoryProvider);
  return UpdateItemDataUseCase(repository);
});

final deleteItemUseCaseProvider = Provider((ref) {
  final repository = ref.read(itemRepositoryProvider);
  return DeleteItemDataUseCase(repository);
});
