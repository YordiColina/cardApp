import 'package:card_app/domain/models/item_data/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardWidget extends StatefulWidget {
  final Item item;
  const CardWidget({super.key, required this.item});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

            context.go('/detail', extra: widget.item);

      },
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromRGBO(158, 123, 187, 1.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(51, 51, 51, 1)
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price: ${widget.item.price}\$",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Color.fromRGBO(158, 123, 187, 1.0),
                      size: 40,
                    ),
                  ),
                  Text(
                    "Brand: ${widget.item.marca}",
                    style: const TextStyle(
                      fontSize: 16,
                        fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(102, 102, 102, 1)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
