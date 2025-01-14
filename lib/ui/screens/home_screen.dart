import 'package:card_app/ui/common/button_widget.dart';
import 'package:card_app/ui/common/card_widget.dart';
import 'package:card_app/ui/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Icon(Icons.home_outlined,size: 50, color: Color.fromRGBO(158, 123, 187, 1.0) ),
              ),
            ),
            const SizedBox( height: 50),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 20, right: 20),
               child: ListView.separated(
                   itemCount: 7,
                   itemBuilder: (context, index) {
                      return const CardWidget();
                    }, separatorBuilder: (BuildContext context, int index) {
                     return const SizedBox(height: 20); },
                     ),
             ),
           ),
            const SizedBox( height: 20,),
           const ButtonWidget(title: "agregar item")

          ],
        ),
      ),
    );
  }
}
