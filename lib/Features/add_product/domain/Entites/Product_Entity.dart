import 'dart:io';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  String? imageUrl;
  final int expirationsMonths;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
  });
}
