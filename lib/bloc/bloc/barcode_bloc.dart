import 'package:bloc/bloc.dart';

import 'package:mobile_scan/data/models/product.dart';
import 'package:mobile_scan/abstract/product_repository.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final ProductRepository repository;

  BarcodeBloc(this.repository) : super(BarcodeInitial()) {
    on<BarcodeScan>(_onBarcodeScan);
  }

  Future<void> _onBarcodeScan(
    BarcodeScan event,
    Emitter<BarcodeState> emit,
  ) async {
    emit(BarcodeLoading());
    try {
      final product = await repository.getBarcode(event.barcode);
      emit(BarcodeLoaded(barcode: event.barcode, product: product));
    } catch (e) {
      emit(BarcodeError(error: e.toString()));
    }
  }
}
