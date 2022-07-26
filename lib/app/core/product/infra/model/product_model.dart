import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final List<String> image;
  final String shortTitle;
  final String description;

  ProductModel({
    required String uid,
    required String title,
    required double price,
    required this.image,
    required this.shortTitle,
    required this.description,
  }) : super(
          uid: uid,
          price: price,
          title: title,
        );
}
