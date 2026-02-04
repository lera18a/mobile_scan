import 'package:flutter/material.dart';
import 'package:mobile_scan/app.dart';

void main() {
  const host = 'http://localhost:3000';
  const codes = ['4601234567890', '123456789012'];
  runApp(const App(host: host, codes: codes));
}
