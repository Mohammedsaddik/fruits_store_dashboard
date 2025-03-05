import 'dart:io';

class PunnerEntity {
  final String namePunnerOne;
  final String namePunnerTwo;
  final File image;
  String? imageUrl;

  PunnerEntity({
    required this.namePunnerOne,
    required this.namePunnerTwo,
    required this.image,
    this.imageUrl,
  });
}
