import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/provider/item_notify_provider.dart';
import '../common/button_widget.dart';
import '../common/card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemNotifierProvider);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Icon(Icons.home_outlined,size: 50, color: Color.fromRGBO(158, 123, 187, 1.0)),
              ),
            ),
            const SizedBox( height: 50),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 20, right: 20),
               child: ListView.separated(
                   itemCount: items.length,
                   itemBuilder: (context, index) {
                      return CardWidget(item: items[index]);
                    }, separatorBuilder: (BuildContext context, int index) {
                     return const SizedBox(height: 20); },
                     ),
             ),
           ),
            const SizedBox( height: 20,),
           Padding(
             padding: const EdgeInsets.only(bottom: 20),
             child: ButtonWidget(title: "Agregar item", onPressed: () {context.go('/form');},),
           )
          ],
        ),
      ),
    );
  }
}
