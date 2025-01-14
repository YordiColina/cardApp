import 'package:card_app/config/provider/usecases_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/item_data/item.dart';
import '../notifier/item_notifier.dart';

final itemNotifierProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  final getItemsUseCase = ref.read(getItemsUseCaseProvider);
  final addItemUseCase = ref.read(addItemUseCaseProvider);
  final updateItemUseCase = ref.read(updateItemUseCaseProvider);
  final deleteItemUseCase = ref.read(deleteItemUseCaseProvider);

  return ItemNotifier(
    getItemsUseCase,
    addItemUseCase,
    updateItemUseCase,
    deleteItemUseCase,
  );
});
