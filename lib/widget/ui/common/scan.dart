import 'package:flutter/material.dart';
import 'package:mobile_scan/widget/ui/common/scan_button.dart';

class Scan extends StatelessWidget {
  const Scan({super.key, this.onPressed, required this.body});
  final void Function()? onPressed;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ScanButton(onPressed: onPressed),
              const SizedBox(height: 16),
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
