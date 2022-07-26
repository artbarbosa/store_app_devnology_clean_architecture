import '../../domain/value_objects/category.dart';

class JsonToProduct {
  static ProductModel fromMap(dynamic json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        image: json['image']);
  }

  static Map<String, dynamic> toMap(ProductModel product) {
    return {
      'id': product.id,
      'title': product.title,
      'category': product.category.name,
      'price': product.price,
      'description': product.description,
      'image': product.image,
    };
  }
}

class ProductModel {}
