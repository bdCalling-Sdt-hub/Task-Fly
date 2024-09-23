import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/my_task/widgets/no_task.dart';

import '../../../../controllers/provider/my_task_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../home/widgets/available_task_card.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen>
    with SingleTickerProviderStateMixin {
  MyTaskController incomeController = Get.put(MyTaskController());

  @override
  void initState() {
    super.initState();
    incomeController.tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: AppString.myTask,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<MyTaskController>(
          builder: (controller) => Column(children: [
                TabBar(
                  controller: controller.tabController,
                  indicatorColor: AppColors.transparent,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
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
                              ? AppColors.clientColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: controller.tabController.index == 0
                                ? Colors.transparent
                                : AppColors.clientColor,
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: AppString.onboarding,
                            color: controller.tabController.index == 0
                                ? Colors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: controller.tabController.index == 1
                              ? AppColors.clientColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: controller.tabController.index == 1
                                ? Colors.transparent
                                : AppColors.clientColor,
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: AppString.ongoing,
                            color: controller.tabController.index == 1
                                ? Colors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: controller.tabController.index == 2
                              ? AppColors.clientColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: controller.tabController.index == 2
                                ? Colors.transparent
                                : AppColors.clientColor,
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: AppString.pending,
                            color: controller.tabController.index == 2
                                ? Colors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: controller.tabController.index == 3
                              ? AppColors.clientColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: controller.tabController.index == 3
                                ? Colors.transparent
                                : AppColors.clientColor,
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: AppString.completed,
                            color: controller.tabController.index == 3
                                ? Colors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: controller.tabController.index == 4
                              ? AppColors.clientColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: controller.tabController.index == 4
                                ? Colors.transparent
                                : AppColors.clientColor,
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: AppString.canceled,
                            color: controller.tabController.index == 4
                                ? Colors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                20.height,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        const Center(
                          child: NoTask(),
                        ),
                        Center(
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.taskDetails),
                                  child: const AvailableTaskCard());
                            },
                          ),
                        ),
                        const Center(
                          child: NoTask(),
                        ),
                        Center(
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () => Get.toNamed(
                                          AppRoutes.taskDetails,
                                          parameters: {
                                            "isCompleted": "isCompleted",
                                            "showOfferButton": "not show"
                                          }),
                                  child: const AvailableTaskCard());
                            },
                          ),
                        ),
                        const Center(
                          child: NoTask(),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1,),
    );
  }
}
