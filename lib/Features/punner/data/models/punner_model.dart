import 'dart:io';
import 'package:fruits_store_dashboard/Features/add_product/domain/Entites/Product_Entity.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Entites/punner_entity.dart';

class PunnerModel {
  final String namePunnerOne;
  final String namePunnerTwo;
  final File image;
  String? imageUrl;

  PunnerModel({
    required this.namePunnerOne,
    required this.namePunnerTwo,
    required this.image,
    this.imageUrl,
  });

  factory PunnerModel.fromEntity(PunnerEntity punnerentity) {
    return PunnerModel(
      namePunnerOne: punnerentity.namePunnerOne,
      namePunnerTwo: punnerentity.namePunnerTwo,
      image: punnerentity.image,
    );
  }

  toJson() {
    return {
      'namePunnerOne': namePunnerOne,
      'namePunnerTwo': namePunnerTwo,
      'image': image,
    };
  }
}
