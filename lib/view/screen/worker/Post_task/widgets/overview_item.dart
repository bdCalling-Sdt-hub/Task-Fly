import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/image/common_image.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    super.key,
    required this.item,
  });

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(item["image"]))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.height,
          CommonImage(
            imageSrc: item['icon'],
            imageType:
                item['title'] == "Ongoing" ? ImageType.png : ImageType.svg,
          ),
          const Spacer(),
          CommonText(
            text: item['title'],
            color: AppColors.white,
          ),
          CommonText(
            text: item['count'],
            color: AppColors.white,
            fontSize: 24,
            top: 8,
            bottom: 8,
          ),
        ],
      ),
    );
  }
}
