import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_fly/controllers/provider_controller/provider_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/other_widgets/common_bar.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/price_box.dart';
import 'package:task_fly/view/screen/services_provider/home/widgets/work_place_item.dart';

import 'category_item.dart';

filterPanel() {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return const Filter();
    },
  );
}

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderHomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(12),
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
              CommonBar(
                title: AppString.workplace,
                onTap: controller.showWorkOnTap,
              ),
              10.height,
              if (controller.showWork)
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
                      title: controller.workPlace[index],
                      selectedItem: controller.selectWorkPlace,
                      onTap: controller.selectItem,
                    );
                  },
                ),
              if (controller.showWork) 20.height,
              CommonBar(
                title: AppString.price,
                onTap: controller.showPriceOnTap,
              ),
              10.height,
              if (controller.showPrice)
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
              if (controller.showPrice) 10.height,
              if (controller.showPrice)
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
              if (controller.showPrice) 20.height,
              CommonBar(
                title: AppString.category,
                onTap: controller.showCategoryOnTap,
              ),
              20.height,
              if (controller.showCategory)
                GridView.builder(
                    itemCount: controller.category.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 42,
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        item: controller.category[index],
                      );
                    }),
              if (controller.showCategory) 20.height,
              CommonButton(
                titleText: AppString.apply,
                onTap: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
