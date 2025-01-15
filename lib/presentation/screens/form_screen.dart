import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../config/provider/item_notify_provider.dart';
import '../../domain/models/item_data/item.dart';
import '../common/button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormScreen extends ConsumerWidget {
  final Item? item;
  const FormScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TextEditingController> controllers = List.generate(9, (index) => TextEditingController());
    setFields(controllers, item);
    List<String> titles = ["Nombre","Descripcion","Precio","Color","Peso","Descripcion detallada",
    "Marca","Modelo","Stock"];
    const uuid = Uuid();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
               return Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20,top: 15),
                 child: TextField(
                   controller: controllers[index],

                   minLines: 1,
                   maxLines: 3,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                     labelText: titles[index],
                   ),
                 ),
               );
            }, separatorBuilder: (BuildContext context, int index) {
               return const SizedBox(height: 20); } , itemCount: 9),
          ),
          ButtonWidget(
            title: "guardar",
            onPressed: () {
              final notifier = ref.read(itemNotifierProvider.notifier);
              if (item == null) {
              final newItem = createItem(controllers, context,uuid.v4(),);
                notifier.addItem(newItem);
              } else {
                final newItem = createItem(controllers, context, item?.id ?? "");
                notifier.updateItem(newItem);
              }
            },
          ),
        ],
      )
    );
  }
}

Item createItem(List<TextEditingController> controllers, BuildContext context,String id) {
  Item? item;
  if(controllers.isNotEmpty) {
    item = Item(
      name: controllers[0].text,
      description: controllers[1].text,
      price: double.parse(controllers[2].text),
      color: controllers[3].text,
      weight: double.parse(controllers[4].text),
      id: id,
      detailDescription: controllers[5].text,
      marca: controllers[6].text,
      modelo: controllers[7].text,
      stock: int.parse(controllers[8].text),
    );
    context.go('/');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Todos los campos son requeridos")));
  }
  return item!;
}

void setFields(List<TextEditingController> controllers, Item? item) {
  {
    if (item != null) {
      controllers[0].text = item.name;
      controllers[1].text = item.description;
      controllers[2].text = item.price.toString();
      controllers[3].text = item.color;
      controllers[4].text = item.weight.toString();
      controllers[5].text = item.detailDescription;
      controllers[6].text = item.marca;
      controllers[7].text = item.modelo;
      controllers[8].text = item.stock.toString();
    }
  }
}
