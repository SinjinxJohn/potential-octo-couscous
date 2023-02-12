class ProductApi {
  int? id;
  String? name;
  String? image;
  int? price;
  String? desc;
  int? category;

  ProductApi(
      {this.id, this.name, this.image, this.price, this.desc, this.category});

  ProductApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    desc = json['desc'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['desc'] = this.desc;
    data['category'] = this.category;
    return data;
  }
}
