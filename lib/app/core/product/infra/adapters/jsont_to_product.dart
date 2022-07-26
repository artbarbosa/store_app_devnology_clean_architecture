import '../model/product_model.dart';

class JsonToProduct {
  static ProductModel fromMap(dynamic json) {
    return ProductModel(
        uid: json['uid'],
        title: json['title'],
        shortTitle: json['short_title'],
        price: json['price'],
        description: json['description'],
        image: json['image']);
  }
}
