import 'package:get/get.dart';
import 'package:task_fly/core/app_routes.dart';
import 'package:task_fly/utils/app_images.dart';

class ReportController extends GetxController {
  List overviewList = [
    {
      "image": AppImages.ongoingReport,
      "title": "On going",
      "count": "1",
      "route": AppRoutes.ongoingScreen
    },
    {
      "image": AppImages.completedReport,
      "title": "Completed",
      "count": "41",
      "route": AppRoutes.completedScreen
    },
    {
      "image": AppImages.pendingReport,
      "title": "Pending",
      "count": "41",
      "route": AppRoutes.pendingScreen
    },
    {
      "image": AppImages.cancelReport,
      "title": "Cancel",
      "count": "19",
      "route": AppRoutes.cancelScreen
    },
  ];
}
