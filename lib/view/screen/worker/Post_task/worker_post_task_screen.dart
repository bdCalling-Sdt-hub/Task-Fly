import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/worker/post_task/worker_post_task_controller.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/worker/Post_task/widgets/task_card.dart';
import '../../../../core/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../component/back.dart';
import '../../../component/bottom_nav_bar/common_bottom_bar.dart';
import 'widgets/overview_item.dart';

class WorkerPostTaskScreen extends StatefulWidget {
  const WorkerPostTaskScreen({super.key});

  @override
  State<WorkerPostTaskScreen> createState() => _WorkerPostTaskScreenState();
}

class _WorkerPostTaskScreenState extends State<WorkerPostTaskScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WorkerPostTaskController.instance.tabController =
        TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: backButton(),
        automaticallyImplyLeading: false,
        title: const CommonText(
          text: AppString.myTasks,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: GetBuilder<WorkerPostTaskController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CommonText(
                    text: AppString.overview,
                    fontSize: 24,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.report),
                    child: const CommonText(
                      text: AppString.report,
                      color: AppColors.clientColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: controller.overviewList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = controller.overviewList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.tabController.index = index;
                        print(controller.tabController.index);
                        setState(() {});
                      },
                      child: OverviewItem(
                        item: item,
                      ),
                    );
                  },
                ),
              ),
              // TabBar(
              //   controller: controller.tabController,
              //   indicatorColor: AppColors.transparent,
              //   dividerColor: AppColors.transparent,
              //   isScrollable: true,
              //   tabAlignment: TabAlignment.start,
              //   padding: EdgeInsets.zero,
              //   labelPadding: const EdgeInsets.only(left: 16),
              //   onTap: (value) {
              //     print(controller.tabController.index);
              //     setState(() {});
              //   },
              //   tabs: [
              //     Tab(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 16),
              //         decoration: BoxDecoration(
              //           color: controller.tabController.index == 0
              //               ? AppColors.clientColor
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(8.0),
              //           border: Border.all(
              //             color: controller.tabController.index == 0
              //                 ? Colors.transparent
              //                 : AppColors.clientColor,
              //           ),
              //         ),
              //         child: Center(
              //           child: CommonText(
              //             text: AppString.ongoing,
              //             color: controller.tabController.index == 0
              //                 ? Colors.white
              //                 : AppColors.black,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Tab(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 16),
              //         decoration: BoxDecoration(
              //           color: controller.tabController.index == 1
              //               ? AppColors.clientColor
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(8.0),
              //           border: Border.all(
              //             color: controller.tabController.index == 1
              //                 ? Colors.transparent
              //                 : AppColors.clientColor,
              //           ),
              //         ),
              //         child: Center(
              //           child: CommonText(
              //             text: AppString.pending,
              //             color: controller.tabController.index == 1
              //                 ? Colors.white
              //                 : AppColors.black,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Tab(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 16),
              //         decoration: BoxDecoration(
              //           color: controller.tabController.index == 2
              //               ? AppColors.clientColor
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(8.0),
              //           border: Border.all(
              //             color: controller.tabController.index == 2
              //                 ? Colors.transparent
              //                 : AppColors.clientColor,
              //           ),
              //         ),
              //         child: Center(
              //           child: CommonText(
              //             text: AppString.completed,
              //             color: controller.tabController.index == 2
              //                 ? Colors.white
              //                 : AppColors.black,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Tab(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 16),
              //         decoration: BoxDecoration(
              //           color: controller.tabController.index == 3
              //               ? AppColors.clientColor
              //               : Colors.transparent,
              //           borderRadius: BorderRadius.circular(8.0),
              //           border: Border.all(
              //             color: controller.tabController.index == 3
              //                 ? Colors.transparent
              //                 : AppColors.clientColor,
              //           ),
              //         ),
              //         child: Center(
              //           child: CommonText(
              //             text: AppString.canceled,
              //             color: controller.tabController.index == 3
              //                 ? Colors.white
              //                 : AppColors.black,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    Center(
                      child: ListView.builder(
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

                    Center(
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.taskDetails,
                                  parameters: {"type": "completed"}),
                              child: const TaskCard(
                                colors: Color(0xFF3e8a02),
                              ));
                        },
                      ),
                    ),
                    Center(
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => Get.toNamed(
                                    AppRoutes.taskDetails,
                                  ),
                              child: const TaskCard(
                                colors: Color(0xFF8a0a02),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
