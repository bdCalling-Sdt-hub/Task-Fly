import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/provider_controller/provider_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/screen/services_provider/task_details/widgets/send_offer.dart';

bottomAdd() {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return const Filter();
    },
  );
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderHomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(CupertinoIcons.clear))
                  .end,
              16.height,
              const CommonButton(
                titleText: AppString.adjust,
                onTap: sendOfferPanel,
                buttonColor: AppColors.p_500,
                titleColor: AppColors.white,
                borderColor: AppColors.transparent,
              ),
              20.height,
              CommonButton(
                titleText: AppString.requestForPayment,
                onTap: () => Get.back(),
                buttonColor: AppColors.textIcon_500,
                titleColor: AppColors.white,
                borderColor: AppColors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
