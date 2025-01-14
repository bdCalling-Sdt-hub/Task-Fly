import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(body: Container()),
    );
  }
}

Future<void> main() async {
  runApp(const TestScreen());
}
