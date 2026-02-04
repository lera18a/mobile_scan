import 'package:flutter/material.dart';

class ErrorScan extends StatelessWidget {
  const ErrorScan({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Text(error, style: const TextStyle(color: Colors.red));
  }
}
