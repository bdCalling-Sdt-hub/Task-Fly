import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
          body: Center(
              child: SliderButton(
        action: () async {
          ///Do something here
          Navigator.of(context).pop();
          return true;
        },
        label: const Text(
          "Slide to cancel Event",
          style: TextStyle(
              color: Color(0xff4a4a4a),
              fontWeight: FontWeight.w500,
              fontSize: 17),
        ),
        icon: const Text(
          "x",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 44,
          ),
        ),
      ))),
    );
  }
}

Future<void> main() async {
  runApp(const TestScreen());
}
