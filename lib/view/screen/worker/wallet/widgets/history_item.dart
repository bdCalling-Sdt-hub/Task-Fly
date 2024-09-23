import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.item});

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: item["title"],
                fontWeight: FontWeight.w600,
              ),
              CommonText(
                text: item["date"],
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              CommonText(
                text: item["tnxId"],
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          CommonText(
            text: "\$${item["amount"]}",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: item["type"] == "withdraw" ? AppColors.red : Colors.green,
          ),
        ],
      ),
    );
  }
}
