import 'package:flutter/material.dart';
import 'package:mobile_scan/data/mock_scanner.dart';
import 'package:mobile_scan/abstract/product_repository.dart';
import 'package:mobile_scan/data/http_product_repository.dart';
import 'package:mobile_scan/abstract/scanner.dart';
import 'package:provider/provider.dart';

class Injector extends StatelessWidget {
  const Injector({
    super.key,
    required this.host,
    required this.codes,
    required this.child,
  });
  final String host;
  final List<String> codes;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductRepository>(
          create: (_) => HttpProductRepository(host: host),
        ),
        Provider<Scanner>(create: (_) => MockScanner(codes: codes)),
      ],
      child: child,
    );
  }
}
