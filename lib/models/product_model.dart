class Product {
  int? id;
  int? catId;
  String? title;
  String? unit;
  int? stockAvailable;
  String? image;
  String? color;
  double? price;
  int? qty;

  Product(
      {this.id,
      this.catId,
      this.title,
      this.unit,
      this.stockAvailable,
      this.image,
      this.color,
      this.price,
      this.qty});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['catId'];
    title = json['title'];
    unit = json['unit'];
    stockAvailable = json['stockAvailable'];
    image = json['image'];
    color = json['color'];
    price = json['price'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catId'] = this.catId;
    data['title'] = this.title;
    data['unit'] = this.unit;
    data['stockAvailable'] = this.stockAvailable;
    data['image'] = this.image;
    data['color'] = this.color;
    data['price'] = this.price;
    data['qty'] = this.qty;
    return data;
  }
}
