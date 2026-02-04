import 'package:mobile_scan/abstract/scanner.dart';

class MockScanner implements Scanner {
  final List<String> codes;
  int i = 0;

  MockScanner({required this.codes});

  @override
  Future<String> scan() async {
    final index = i % codes.length;
    final code = codes[index];
    i++;
    return code;
  }
}
