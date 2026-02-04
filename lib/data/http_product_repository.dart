import 'package:dio/dio.dart';
import 'package:mobile_scan/data/models/product.dart';
import 'package:mobile_scan/abstract/product_repository.dart';

class HttpProductRepository implements ProductRepository {
  late Dio _dio;
  final String host;

  HttpProductRepository({required this.host}) {
    _dio = Dio(BaseOptions(baseUrl: host));
  }

  @override
  Future<Product> getBarcode(String barcode) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/products/$barcode',
      );
      final data = response.data;
      if (data == null) {
        throw Exception('Empty response body');
      }
      return Product.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('NOT_FOUND');
      }
      rethrow;
    }
  }
}
