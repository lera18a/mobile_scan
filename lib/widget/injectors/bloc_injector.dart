import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scan/abstract/product_repository.dart';
import 'package:mobile_scan/bloc/bloc/barcode_bloc.dart';

class BlocInjector extends StatelessWidget {
  const BlocInjector({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BarcodeBloc(context.read<ProductRepository>()),
      child: child,
    );
  }
}
