import 'package:flutter/material.dart';
import 'package:mobile_scan/widget/injectors/bloc_injector.dart';
import 'package:mobile_scan/widget/injectors/injector.dart';
import 'package:mobile_scan/widget/ui/bloc_widget.dart';

class App extends StatelessWidget {
  const App({super.key, required this.host});
  final String host;

  @override
  Widget build(BuildContext context) {
    return Injector(
      host: host,
      child: BlocInjector(
        child: MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: BlocWidget(),
        ),
      ),
    );
  }
}
