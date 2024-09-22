import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_icons.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/filter.dart';

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
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
                backgroundColor: AppColors.clientColor,
                child: Icon(
                  Icons.headset_mic_outlined,
                  color: AppColors.white,
                )),
          ),
        ],
      ),
      body: GetBuilder<ShowGoogleMapController>(
        builder: (controller) => Stack(
          children: [
            ShowGoogleMap(
              onTapLatLong: (value) => print(value),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonTextField(
                        fillColor: AppColors.white,
                        hintText: AppString.search,
                        textColor: AppColors.clientColor,
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: AppColors.clientColor,
                        ),
                      ),
                    ),
                    12.width,
                    GestureDetector(
                      onTap: filterPanel,
                      child: Container(
                        height: 48,
                        width: 48,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: CommonImage(
                          imageSrc: AppIcons.filter,
                          imageType: ImageType.svg,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 9,
      ),
    );
  }
}
