import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../image/common_image.dart';
import '../text/common_text.dart';

class Item extends StatelessWidget {
  const Item(
      {super.key,
      this.icon,
      required this.title,
      this.image = "",
      this.onTap,
      this.color = AppColors.black,
      this.vertical = 4,
      this.horizontal = 16,
      this.disableIcon = false});

  final IconData? icon;
  final String title;
  final String image;

  final bool disableIcon;
  final VoidCallback? onTap;
  final Color color;
  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontal.w, vertical: vertical.h),
          child: Row(
            children: [
              if (!disableIcon)
                icon != null
                    ? CircleAvatar(
                        backgroundColor: AppColors.textIcon_100,
                        radius: 14,
                        child: ClipOval(
                          child: Icon(
                            icon,
                            color: color,
                          ),
                        ),
                      )
                    : CommonImage(imageSrc: image),
              CommonText(
                text: title,
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                left: disableIcon ? 0 : 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
