import 'package:flutter/material.dart';
import 'package:task_fly/utils/app_colors.dart';

import '../../../utils/app_string.dart';
import '../text/common_text.dart';

class CommonBar extends StatelessWidget {
  const CommonBar({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 20,
            color: AppColors.p_500,
          ),
          InkWell(
            onTap: onTap,
            child: const Row(
              children: [
                CommonText(
                  text: AppString.viewAll,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
