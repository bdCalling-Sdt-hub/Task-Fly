import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';

import '../../../../../controllers/provider/provider_controller.dart';
import '../../task_details/widgets/send_offer.dart';

offerPanel() {
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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                width: double.infinity,
                child: const CommonText(
                  text: " 120 € ",
                  fontSize: 52,
                ),
              ),
              const CommonButton(
                titleText: "Clean my car",
                titleSize: 24,
                buttonColor: AppColors.transparent,
              ),
              24.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "Location",
                    fontWeight: FontWeight.w600,
                  ),
                  CommonText(
                    text: ": Road:05, USA",
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              12.height,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "Due",
                    fontWeight: FontWeight.w600,
                  ),
                  CommonText(
                    text: ": 22/12/2024",
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              24.height,
              Row(
                children: [
                  const Expanded(
                    child: CommonButton(
                      onTap: sendOfferPanel,
                      titleText: AppString.sendYourOffer,
                      buttonColor: AppColors.textIcon_500,
                      titleColor: AppColors.white,
                      borderColor: AppColors.transparent,
                    ),
                  ),
                  16.width,
                  const Expanded(
                    child: CommonButton(
                      titleText: AppString.acceptTask,
                      buttonColor: AppColors.p_500,
                      titleColor: AppColors.white,
                      borderColor: AppColors.transparent,
                    ),
                  ),
                ],
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
