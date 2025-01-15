import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/provider/item_notify_provider.dart';
import '../../domain/models/item_data/item.dart';
import '../common/button_widget.dart';

class DetailsScreen extends ConsumerWidget {
  final Item item;
  const DetailsScreen({super.key, required this.item});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/');
          },
        ),backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Container(
                width: 380,
                height: 420,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(158, 123, 187, 1.0),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(51, 51, 51, 1)
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromRGBO(158, 123, 187, 1.0),
                        size: 70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Price: ${item.price}\$",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              ),
                            ),
                            Text(
                              "Stock: ${item.stock}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Model: ${item.modelo}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              ),
                            ),
                            Text(
                              "Brand: ${item.marca}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Color: ${item.color}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              ),
                            ),
                            Text(
                              "Weight: ${item.weight}kg",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Detail descriptión: ${item.detailDescription}",
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50,),
            ButtonWidget(title: 'Editar item', onPressed: () {context.go('/form', extra: item);},),
            const SizedBox(height: 20,),
            ButtonWidget(title: "Eliminar item",onPressed: () {
              final notifier = ref.read(itemNotifierProvider.notifier);
            notifier.deleteItem(item.id ?? "");
            context.go('/');
            }
              ,)
          ],
        )
      ),
    );
  }
}
