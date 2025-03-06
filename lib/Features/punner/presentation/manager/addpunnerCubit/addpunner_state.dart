part of 'addpunner_cubit.dart';

@immutable
abstract class AddpunnerState {}

class AddpunnerInitial extends AddpunnerState {}

class AddpunnerLoading extends AddpunnerState {}

class AddpunnerError extends AddpunnerState {
  final String ErrorMessage;

  AddpunnerError({required this.ErrorMessage});
}

class AddpunnerSuccess extends AddpunnerState {}
