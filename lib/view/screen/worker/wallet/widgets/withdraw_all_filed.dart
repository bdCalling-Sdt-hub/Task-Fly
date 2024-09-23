import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/worker/wallet/withdraw_controller.dart';
import 'package:task_fly/helpers/other_helper.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';

class WithdrawAllFiled extends StatelessWidget {
  const WithdrawAllFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CommonText(
            text: AppString.accountHolderName,
            bottom: 8,
          ),
          CommonTextField(
            hintText: AppString.accountHolderName,
            validator: OtherHelper.validator,
            controller: controller.accountHolderNameController,
          ),
          const CommonText(
            text: AppString.accountNumber,
            bottom: 8,
            top: 16,
          ),
          CommonTextField(
            hintText: AppString.accountNumber,
            validator: OtherHelper.validator,
            controller: controller.accountNumberController,
          ),
          const CommonText(
            text: AppString.amount,
            bottom: 8,
            top: 16,
          ),
          CommonTextField(
            hintText: AppString.amount,
            validator: OtherHelper.validator,
            controller: controller.amountController,
          ),
        ],
      ),
    );
  }
}
