import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final List<String> image;
  final String shortTitle;
  final String description;

  ProductModel(
    this.shortTitle,
    this.description, {
    required int id,
    required String title,
    required String description,
    required num price,
    required this.image,
  });
}
