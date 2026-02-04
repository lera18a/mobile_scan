import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: FilledButton(onPressed: onPressed, child: Text('Scan')),
    );
  }
}
