import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/worker/wallet/withdraw_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/worker/wallet/widgets/balance_card.dart';
import 'package:task_fly/view/screen/worker/wallet/widgets/withdraw_all_filed.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.withdraw,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<WithdrawController>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Center(child: BalanceCard()),
              40.height,
              const WithdrawAllFiled(),
              40.height,
              CommonButton(
                titleText: AppString.withdraw,
                onTap: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
