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

sortPanel() {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: Get.context!,
    builder: (context) {
      return Sort();
    },
  );
}

class Sort extends StatefulWidget {
  const Sort({super.key});

  @override
  State<Sort> createState() => _FilterState();
}

class _FilterState extends State<Sort> {
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
                text: AppString.sort,
                fontSize: 20,
                color: AppColors.p_500,
                bottom: 16,
              ),
              CommonBar(
                title: AppString.price,
                onTap: controller.showSortPriceOnTap,
              ),
              10.height,
              if (controller.showSortPrice)
                GridView.builder(
                  itemCount: controller.sortPrice.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisExtent: 42,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return WorkPlaceItem(
                      title: controller.sortPrice[index],
                    );
                  },
                ),
              if (controller.showSortPrice) 20.height,
              CommonBar(
                title: AppString.dueDate,
                onTap: controller.showDueDateOnTap,
              ),
              10.height,
              if (controller.showDueDate)
                GridView.builder(
                  itemCount: controller.dueDate.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisExtent: 42,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return WorkPlaceItem(
                      title: controller.dueDate[index],
                    );
                  },
                ),
              if (controller.showDueDate) 10.height,
              CommonBar(
                title: AppString.postDate,
                onTap: controller.showPostDateOnTap,
              ),
              20.height,
              if (controller.showPostDate)
                GridView.builder(
                  itemCount: controller.postDate.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisExtent: 42,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return WorkPlaceItem(
                      title: controller.postDate[index],
                    );
                  },
                ),
              if (controller.showPostDate) 20.height,
              const CommonButton(titleText: AppString.apply)
            ],
          ),
        ),
      ),
    );
  }
}
