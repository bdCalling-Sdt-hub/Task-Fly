import 'package:flutter/material.dart';
import 'package:task_fly/controllers/provider_controller/provider_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({super.key, required this.item});

  var item;

  @override
  State<CategoryItem> createState() => _WorkPlaceItemState();
}

class _WorkPlaceItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ProviderHomeController.instance.selectCategoryItem(widget.item),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: widget.item["isSelected"]
              ? AppColors.clientColor
              : AppColors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.p_500)),
        ),
        child: Row(
          children: [
            CommonImage(
              imageSrc: widget.item["icon"],
              imageType: ImageType.svg,
              imageColor:
                  widget.item["isSelected"] ? AppColors.white : AppColors.p_500,
            ),
            Flexible(
              child: CommonText(
                text: widget.item["name"],
                color: widget.item["isSelected"]
                    ? AppColors.white
                    : AppColors.p_500,
                textAlign: TextAlign.center,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ).center,
            ),
          ],
        ),
      ),
    );
  }
}
