import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import '../../../../../utils/app_colors.dart';

cancelBottomSheet() {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return const SendOffer();
    },
  );
}

class SendOffer extends StatelessWidget {
  const SendOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              text: AppString.cancelTitle,
              fontSize: 20,
              color: AppColors.p_500,
            ),
            const CommonText(
              text: AppString.cancelDetails,
              fontWeight: FontWeight.w400,
              fontSize: 18,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: CommonButton(
                  titleText: AppString.no,
                  buttonColor: AppColors.s_600,
                  borderColor: AppColors.transparent,
                  onTap: () => Get.back(),
                  buttonHeight: 44,
                )),
                16.width,
                Expanded(
                    child: CommonButton(
                  titleText: AppString.yes,
                  buttonColor: AppColors.primaryColor,
                  buttonHeight: 44,
                  onTap: () => Get.back(),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
