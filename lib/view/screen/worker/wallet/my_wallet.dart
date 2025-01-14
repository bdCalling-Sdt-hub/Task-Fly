import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/worker/wallet/my_wallet_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/worker/wallet/widgets/history_item.dart';

import '../../../component/back.dart';
import 'widgets/balance_card.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        title: const CommonText(
          text: AppString.myWallet,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<MyWalletController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const BalanceCard(),
              const CommonText(
                text: AppString.history,
                fontSize: 24,
                top: 12,
              ).start,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.historyList.length,
                  itemBuilder: (context, index) {
                    var item = controller.historyList[index];
                    return HistoryItem(item: item);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
