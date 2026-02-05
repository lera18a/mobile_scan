import 'package:flutter/material.dart';
import 'package:mobile_scan/app.dart';

void main() {
  const port = ':3000';
  const ip = '192.168.1.220';
  const host = 'http://$ip$port';

  runApp(const App(host: host));
}
