import 'package:card_app/config/provider/usecases_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/item_data/item.dart';
import '../notifier/item_notifier.dart';

final itemNotifierProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  final getItemsUseCase = ref.watch(getItemsUseCaseProvider);
  final addItemUseCase = ref.watch(addItemUseCaseProvider);
  final updateItemUseCase = ref.watch(updateItemUseCaseProvider);
  final deleteItemUseCase = ref.watch(deleteItemUseCaseProvider);

  return ItemNotifier(
    getItemsUseCase,
    addItemUseCase,
    updateItemUseCase,
    deleteItemUseCase,
  );
});
