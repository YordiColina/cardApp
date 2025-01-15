class Item {
  final String name;
  final String description;
  final double price;
  final String color;
  final double weight;
  final String detailDescription;
  final String id;
  final String marca;
  final String modelo;
  final int stock;

  Item( {required this.name, required this.description, required this.price, required this.color,
         required this.weight, required this.id, required this.detailDescription, required this.marca,
         required this.modelo, required this.stock});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'detailDescription': detailDescription,
      'price': price,
      'color': color,
      'weight' : weight,
      'marca' : marca,
      'modelo' : modelo,
      'stock' : stock
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name : map['name'],
      description: map['description'],
      price : map['price'],
      id: map['id'],
      detailDescription: map['detailDescription'],
      weight: map['weight'],
      color: map['color'],
      marca: map['marca'],
      modelo: map['modelo'],
      stock: map['stock']
    );
  }
}