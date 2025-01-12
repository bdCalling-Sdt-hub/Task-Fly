import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/provider/post_task_controller.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/post_task/widgets/step_one.dart';

import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../worker/Post_task/widgets/task_card.dart';
import 'widgets/step_three.dart';
import 'widgets/step_two.dart';

class PostTaskInfo extends StatefulWidget {
  const PostTaskInfo({super.key});

  @override
  State<PostTaskInfo> createState() => _PostTaskInfoState();
}

class _PostTaskInfoState extends State<PostTaskInfo>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    PostTaskController.instance.tabController =
        TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostTaskController>(
      builder: (controller) => Scaffold(
        extendBody: true,

        appBar: AppBar(
          title: CommonText(
            text: controller.appbarTitle,
            fontSize: 24,
            maxLines: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Column(
          children: [
            TabBar(
              controller: controller.tabController,
              indicatorColor: AppColors.transparent,
              dividerColor: AppColors.transparent,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.only(left: 16),
              onTap: (value) {
                print(controller.tabController.index);
                setState(() {});
              },
              tabs: [
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: controller.tabController.index == 0
                          ? AppColors.p_100
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: CommonText(
                        text: AppString.stepOne,
                        color: AppColors.textIcon_500,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: controller.tabController.index == 1
                          ? AppColors.p_100
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: CommonText(
                        text: AppString.stepTwo,
                        color: AppColors.textIcon_500,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: controller.tabController.index == 2
                          ? AppColors.p_100
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: CommonText(
                        text: AppString.stepThree,
                        color: AppColors.textIcon_500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(
                  controller: controller.tabController,
                  children: const [
                    StepOne(),
                    Center(
                      child: StepTwo(),
                    ),
                    Center(
                      child: StepThree(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
