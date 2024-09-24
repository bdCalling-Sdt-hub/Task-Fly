import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/worker/report_controller.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_images.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/worker/report/widgets/incode_chart.dart';

import 'widgets/overview_chart.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.report,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<ReportController>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CommonText(
                text: AppString.taskOverview,
                fontSize: 20,
              ).start,
              GridView.builder(
                itemCount: controller.overviewList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  var item = controller.overviewList[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(item['route']),
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(item['image']))),
                      child: Column(
                        children: [
                          CommonText(
                            text: item['count'],
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                          CommonText(
                            text: item['title'],
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 350, child: TaskOverviewChart()),
              const SizedBox(height: 300, child: IncomeChartPage()),
              const CommonButton(
                titleText: AppString.exportData,
                titleSize: 20,
              ),
              30.height
            ],
          ),
        ),
      ),
    );
  }
}
