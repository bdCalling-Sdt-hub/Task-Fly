import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/utils/app_icons.dart';
import 'package:task_fly/utils/app_images.dart';

class WorkerPostTaskController extends GetxController {

  late TabController tabController;



  static WorkerPostTaskController get instance => Get.put(WorkerPostTaskController());

  List overviewList = [
    {
      "image": AppImages.ongoing,
      "icon": AppImages.ongoingIcon,
      "title": "on going",
      "count": "1",
    },
    // {
    //   "image": AppImages.pending,
    //   "icon": AppIcons.pending,
    //   "title": "Pending",
    //   "count": "41",
    // },
    {
      "image": AppImages.completed,
      "icon": AppIcons.completed,
      "title": "Completed",
      "count": "76",
    },
    {
      "image": AppImages.cancel,
      "icon": AppIcons.cancel,
      "title": "Cancel",
      "count": "19",
    },
  ];
}
