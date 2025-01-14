import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

Widget backButton() => InkWell(
      onTap: Get.back,
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.clientColor, width: 2),
              shape: BoxShape.circle,
              color: AppColors.transparent),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.clientColor,
          )),
    );
