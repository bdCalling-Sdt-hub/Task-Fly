import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';


class PostItem extends StatefulWidget {
  PostItem({super.key, required this.item});

  var item;

  @override
  State<PostItem> createState() => _WorkPlaceItemState();
}

class _WorkPlaceItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.clientColor,
          radius: 30,
          child: ClipOval(
            child: CommonImage(
              imageSrc: widget.item["icon"],
              imageType: ImageType.svg,
              imageColor: AppColors.white,
              height: 40,
              width: 40,
            ),
          ),
        ),
        Flexible(
          child: CommonText(
            text: widget.item["name"],
            color: AppColors.p_500,
            textAlign: TextAlign.center,
            fontSize: 14,
            top: 4,
            fontWeight: FontWeight.w400,
          ).center,
        ),
      ],
    );
  }
}
