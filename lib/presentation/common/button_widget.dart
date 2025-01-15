import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWidget extends ConsumerWidget {
  final String title;
  final VoidCallback onPressed;
  const ButtonWidget({super.key, required this.title,required this.onPressed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(158, 123, 187, 1.0)
        ),
        onPressed: () {
        onPressed();
        },
        child:  Text(title, style: const TextStyle(
            color: Colors.white
        ),));
  }
}
