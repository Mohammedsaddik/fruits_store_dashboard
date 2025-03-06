part of 'addproduct_cubit.dart';

@immutable
abstract class AddproductState {}

class AddproductInitial extends AddproductState {}

class AddproductLoading extends AddproductState {}

class AddproductError extends AddproductState {
  final String ErrorMessage;

  AddproductError({required this.ErrorMessage});
}

class AddproductSuccess extends AddproductState {}
