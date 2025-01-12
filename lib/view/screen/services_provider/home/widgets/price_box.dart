import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../component/text/common_text.dart';

class PriceBox extends StatelessWidget {
  final int price;
  final String label;

  const PriceBox({
    required this.price,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(
          text: label,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.p_500,
        ),
        4.height,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.clientColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CommonText(
            text: '€ $price${price >= 500 ? "+" : ""}',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.p_500,
          ),
        ),
      ],
    );
  }
}
