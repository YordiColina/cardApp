import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/item_data/item.dart';
import '../../domain/usecases/add_item_data_usecase.dart';
import '../../domain/usecases/delete_item_data_usecase.dart';
import '../../domain/usecases/get_items_list_usecase.dart';
import '../../domain/usecases/update_item_data_usecase.dart';

class ItemNotifier extends StateNotifier<List<Item>> {
  final GetItemsUseCase getItemsUseCase;
  final AddItemDataUseCase addItemUseCase;
  final UpdateItemDataUseCase updateItemUseCase;
  final DeleteItemDataUseCase deleteItemUseCase;

  ItemNotifier(
      this.getItemsUseCase,
      this.addItemUseCase,
      this.updateItemUseCase,
      this.deleteItemUseCase,
      ) : super([]) {
    _initializeItems();
  }

  Future<void> _initializeItems() async {
    final items = await getItemsUseCase.execute();
    if (items.isEmpty) {
      final uuid = Uuid();
      await addItemUseCase.execute(Item(
        id: uuid.v4(),
        name: 'Balón de fútbol',
        description: 'Objeto redondo para jugar al fútbol',
        detailDescription: "El balón de fútbol es una pelota esférica utilizada en los deportes"
            " de equipo conocidos como fútbol y fútbol sala. Es uno de los elementos más importantes"
            " del deporte, ya que sin él no se podría jugar. Su circunferencia debe ser de entre 68 y 70 cm"
            ","" y su peso de entre 410 y 450 g al inicio del partido.",
        price: 10.0,
        weight: 1.5,
        color: "Blanco",
        marca: "Adidas",
        modelo: "Tango",
        stock: 100
      ));
      await addItemUseCase.execute(Item(
        id: uuid.v4(),
        name: 'Silla',
        description: 'Objeto de madera o acero, con asiento y respaldo',
        price: 20.0,
        weight: 2.0,
        detailDescription: "Una silla es un mueble que se utiliza para sentarse. Se compone de un asiento"
            " que puede tener respaldo, y de cuatro patas que sirven para sostenerlo. Las sillas pueden"
            " ser de diferentes materiales, como madera, metal o plástico, y de diferentes formas y tamaños."
            " Se utilizan en casas, oficinas, escuelas, restaurantes y otros lugares.",
        color: "Marrón",
        marca: "Ikea",
        modelo: "Malm",
        stock: 50
      ));


      state = await getItemsUseCase.execute();
    } else {
      state = items;
    }
  }

  Future<void> addItem(Item item) async {
    await addItemUseCase.execute(item);
    state = await getItemsUseCase.execute();
  }

  Future<void> updateItem(Item item) async {
    await updateItemUseCase.execute(item);
    state = await getItemsUseCase.execute();
  }

  Future<void> deleteItem(String id) async {
    await deleteItemUseCase.execute(id);
    state = await getItemsUseCase.execute();
  }
}
