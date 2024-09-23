import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 320,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.wallet))),
      child: Column(
        children: [
          const CommonText(
            text: AppString.yourBalance,
            fontSize: 20,
            color: Colors.white,
            top: 30,
          ),
          const CommonText(
            text: "\$500",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CommonButton(
              titleText: AppString.withdraw,
              onTap: () => Get.toNamed(AppRoutes.withdraw),
            ),
          ),
          30.height
        ],
      ),
    );
  }
}
