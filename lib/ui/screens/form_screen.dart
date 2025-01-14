import 'package:card_app/ui/common/button_widget.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
               return Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                 child: TextField(
                   decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                     labelText: 'Nombre',
                   ),
                 ),
               );
            }, separatorBuilder: (BuildContext context, int index) {
               return const SizedBox(height: 20); } , itemCount: 6),
          ),
         const ButtonWidget(title: "guardar")
        ],
      )
    );
  }
}
