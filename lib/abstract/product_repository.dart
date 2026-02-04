import 'package:mobile_scan/data/models/product.dart';

abstract class ProductRepository {
  Future<Product> getBarcode(String barcode);
}
