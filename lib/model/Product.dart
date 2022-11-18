class Product {
  int? id;
  String? name;
  int? price;
  String? description;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['price'] = price;
    map['description'] = description;

    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    description = map['description'];
  }
}
