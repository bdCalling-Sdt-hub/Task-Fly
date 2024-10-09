import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/helpers/prefs_helper.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/task_details/widgets/all_filed.dart';
import 'package:task_fly/view/screen/services_provider/task_details/widgets/provider%20info.dart';
import 'package:task_fly/view/screen/services_provider/task_details/widgets/send_offer.dart';
import 'package:task_fly/view/screen/services_provider/task_details/widgets/send_review.dart';

import '../../../../controllers/provider/task_details_controller.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({
    super.key,
  });

  final String type = Get.parameters["type"] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TaskDetailsController>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                width: double.infinity,
                color: AppColors.s_500,
                child: const CommonText(
                  text: " 120 € ",
                  fontSize: 52,
                ),
              ),
              if (type == "sendOffer")
                Row(
                  children: [
                    if (PrefsHelper.myRole == 'tasker')
                      const Expanded(
                        child: CommonButton(
                          onTap: sendOfferPanel,
                          titleText: AppString.sendYourOffer,
                          buttonColor: AppColors.textIcon_500,
                          titleColor: AppColors.white,
                          borderColor: AppColors.transparent,
                        ),
                      ),
                    if (PrefsHelper.myRole == 'tasker') 16.width,
                    Expanded(
                      child: CommonButton(
                        onTap: controller.acceptTaskOnTap,
                        titleText: AppString.acceptTask,
                        buttonColor: AppColors.p_500,
                        titleColor: AppColors.white,
                        borderColor: AppColors.transparent,
                      ),
                    ),
                  ],
                ),
              if (type == "completed")
                const CommonButton(
                  titleText: AppString.pendingReview,
                  onTap: sendReview,
                ),
              if (type == "ongoing")
                const CommonButton(
                  titleText: AppString.requestForPayment,
                  onTap: sendReview,
                ),
              if (type.isNotEmpty) 24.height,
              const CommonButton(
                titleText: "Clean my car",
                titleSize: 24,
                buttonColor: AppColors.transparent,
              ),
              16.height,
              const ProviderInfo(),
              16.height,
              const AllFiled(),
              30.height
            ],
          ),
        ),
      ),
    );
  }
}
