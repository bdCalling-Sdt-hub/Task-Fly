import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';

import '../../../../controllers/google map/google_map_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../component/google_map/google_map.dart';
import '../../../component/text/common_text.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  @override
  void initState() {
    ShowGoogleMapController.instance.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ShowGoogleMapController>(
        builder: (controller) => Stack(
          children: [
            ShowGoogleMap(
              onTapLatLong: (value) => print(value),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(
      ),
    );
  }
}
