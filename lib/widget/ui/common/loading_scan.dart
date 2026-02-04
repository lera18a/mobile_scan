import 'package:flutter/material.dart';

class LoadingScan extends StatelessWidget {
  const LoadingScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          width: double.infinity,
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
