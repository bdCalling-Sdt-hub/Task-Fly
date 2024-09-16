import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_fly/controllers/provider_controller/provider_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/other_widgets/common_bar.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/price_box.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/work_place_item.dart';

filterPanel() {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return Filter();
    },
  );
}

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderHomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(CupertinoIcons.clear))
                  .end,
              const CommonText(
                text: AppString.filter,
                fontSize: 20,
                color: AppColors.p_500,
                bottom: 16,
              ),
              const CommonBar(title: AppString.workplace),
              20.height,
              GridView.builder(
                itemCount: controller.workPlace.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisExtent: 42,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return WorkPlaceItem(
                    item: controller.workPlace[index],
                  );
                },
              ),
              20.height,
              const CommonBar(title: AppString.price),
              10.height,
              RangeSlider(
                values: controller.currentRangeValues,
                min: 0,
                max: 500,
                divisions: 50,
                activeColor: AppColors.clientColor,
                inactiveColor: Colors.grey.shade300,
                onChanged: (RangeValues values) {
                  setState(() {
                    controller.currentRangeValues = values;
                  });
                },
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceBox(
                      price: controller.currentRangeValues.start.toInt(),
                      label: "Minimum"),
                  PriceBox(
                      price: controller.currentRangeValues.end.toInt(),
                      label: "Maximum"),
                ],
              ),
              20.height,
              const CommonBar(title: AppString.category),
              20.height,
              GridView.builder(
                  itemCount: controller.category.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 42,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return WorkPlaceItem(
                      item: controller.category[index],
                    );
                  }),
              20.height,
              const CommonButton(titleText: AppString.apply)
            ],
          ),
        ),
      ),
    );
  }
}
