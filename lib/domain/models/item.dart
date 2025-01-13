class Item {
  final String name;
  final String description;
  final double price;
  final String color;
  final String weight;
  final String id;

  Item( {required this.name, required this.description, required this.price, required this.color, required this.weight, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'weight' : weight
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name : map['name'],
      description: map['description'],
      price : map['price'],
      id: map['id'],
      weight: map['weight'],
      color: map['color'],
    );
  }
}