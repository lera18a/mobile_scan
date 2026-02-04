part of 'barcode_bloc.dart';

sealed class BarcodeState {}

class BarcodeInitial extends BarcodeState {}

class BarcodeLoading extends BarcodeState {}

class BarcodeLoaded extends BarcodeState {
  final String barcode;
  final Product product;

  BarcodeLoaded({required this.barcode, required this.product});
}

class BarcodeError extends BarcodeState {
  final String error;
  BarcodeError({required this.error});
}
