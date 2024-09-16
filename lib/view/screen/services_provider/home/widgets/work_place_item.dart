import 'package:flutter/material.dart';
import 'package:task_fly/controllers/provider_controller/provider_controller.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class WorkPlaceItem extends StatefulWidget {
  WorkPlaceItem({super.key, required this.item});

  var item;

  @override
  State<WorkPlaceItem> createState() => _WorkPlaceItemState();
}

class _WorkPlaceItemState extends State<WorkPlaceItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProviderHomeController.instance.selectItem(widget.item),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: ShapeDecoration(
          color: widget.item["isSelected"]
              ? AppColors.clientColor
              : AppColors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.p_500)),
        ),
        child: CommonText(
          text: widget.item["name"],
          color: widget.item["isSelected"] ? AppColors.white : AppColors.p_500,
          textAlign: TextAlign.center,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ).center,
      ),
    );
  }
}
