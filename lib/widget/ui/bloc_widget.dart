import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scan/bloc/bloc/barcode_bloc.dart';
import 'package:mobile_scan/widget/ui/common/camera_scan.dart';
import 'package:mobile_scan/widget/ui/common/loaded_scan.dart';
import 'package:mobile_scan/widget/ui/common/loading_scan.dart';
import 'package:mobile_scan/widget/ui/common/scan.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<BarcodeBloc, BarcodeState>(
            builder: (context, state) {
              return Scan(
                onPressed: () async {
                  final barcode = await Navigator.of(context).push<String>(
                    MaterialPageRoute(builder: (_) => const CameraScan()),
                  );
                  if (!context.mounted) return;
                  if (barcode == null || barcode.isEmpty) return;
                  context.read<BarcodeBloc>().add(
                    BarcodeScan(barcode: barcode),
                  );
                },
                body: switch (state) {
                  BarcodeInitial() => Text('Нажми Scan'),
                  BarcodeLoading() => LoadingScan(),
                  BarcodeLoaded() => LoadedScan(
                    barcode: state.barcode,
                    product: state.product,
                  ),
                  BarcodeError() => ErrorWidget(state.error),
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
