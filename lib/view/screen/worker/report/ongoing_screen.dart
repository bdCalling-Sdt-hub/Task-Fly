import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/worker/report_controller.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';

import '../../../../core/app_routes.dart';
import '../../../component/back.dart';
import '../Post_task/widgets/task_card.dart';

class OngoingScreen extends StatelessWidget {
  const OngoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        title: const CommonText(
          text: AppString.ongoing,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<ReportController>(
        builder: (controller) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.taskDetails,
                    parameters: {"type": "ongoing"}),
                child: const TaskCard(
                  colors: Color(0xFF023e8a),
                ));
          },
        ),
      ),
    );
  }
}
