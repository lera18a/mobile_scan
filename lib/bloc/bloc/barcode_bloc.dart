import 'package:bloc/bloc.dart';

import 'package:mobile_scan/data/models/product.dart';
import 'package:mobile_scan/abstract/product_repository.dart';
import 'package:mobile_scan/abstract/scanner.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final Scanner scanner;
  final ProductRepository repository;

  BarcodeBloc(this.scanner, this.repository) : super(BarcodeInitial()) {
    on<BarcodeScan>(_onBarcodeScan);
  }

  Future<void> _onBarcodeScan(
    BarcodeScan event,
    Emitter<BarcodeState> emit,
  ) async {
    // Future.delayed(Duration(seconds: 2),()=>emit(BarcodLoading()) );
    emit(BarcodeLoading());
    try {
      final code = await scanner.scan();
      final product = await repository.getBarcode(code);
      emit(BarcodeLoaded(barcode: code, product: product));
    } catch (e) {
      emit(BarcodeError(error: e.toString()));
    }
  }
}
