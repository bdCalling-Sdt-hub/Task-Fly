import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    incomeController.tabController = TabController(length: 3, vsync: this);
    incomeController.changeTab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CommonText(
          text: AppString.myTasks,
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
                    if (kDebugMode) {
                      print(controller.tabController.index);
                    }
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
                            text: AppString.ongoing,
                            color: controller.tabController.index == 0
                                ? Colors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    // Tab(
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     decoration: BoxDecoration(
                    //       color: controller.tabController.index == 1
                    //           ? AppColors.clientColor
                    //           : Colors.transparent,
                    //       borderRadius: BorderRadius.circular(8.0),
                    //       border: Border.all(
                    //         color: controller.tabController.index == 1
                    //             ? Colors.transparent
                    //             : AppColors.clientColor,
                    //       ),
                    //     ),
                    //     child: Center(
                    //       child: CommonText(
                    //         text: AppString.pending,
                    //         color: controller.tabController.index == 1
                    //             ? Colors.white
                    //             : AppColors.black,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: controller.tabController.index == 1
                              ? const Color(0xFF3e8a02)
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
                            text: AppString.completed,
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
                              ? const Color(0xFF8a0a02)
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
                            text: AppString.canceled,
                            color: controller.tabController.index == 2
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
                        Center(
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.taskDetails),
                                  child: const AvailableTaskCard(
                                    color: Color(0xFF023e8a),
                                  ));
                            },
                          ),
                        ),
                        // const Center(
                        //   child: NoTask(),
                        // ),
                        Center(
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () => Get.toNamed(
                                      AppRoutes.taskDetails,
                                      parameters: {"type": "completed "}),
                                  child: const AvailableTaskCard(
                                    color: Color(0xFF3e8a02),
                                  ));
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
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
