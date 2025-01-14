import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';


class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  String _selectedPaymentType = 'Total';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CommonText(text: AppString.whatIsYourBudget),
        const CommonText(
          text: AppString.priceDetails,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          maxLines: 2,
          textAlign: TextAlign.start,
          top: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: 'Total',
                  groupValue: _selectedPaymentType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPaymentType = value!;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'Hourly Rate',
                  groupValue: _selectedPaymentType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPaymentType = value!;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Text(
                  'Hourly Rate',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        8.height,
        const CommonButton(
          titleText: "\$10",
          buttonColor: AppColors.p_50,
          borderColor: AppColors.transparent,
        ),
        const Spacer(),
        CommonButton(
          titleText: AppString.next,
          onTap: () => Get.toNamed(AppRoutes.serviceProviderHome),
        ),
        30.height
      ],
    );
  }
}
