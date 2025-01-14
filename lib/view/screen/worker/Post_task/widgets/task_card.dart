import 'package:flutter/material.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.colors});

  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: colors),

        gradient: LinearGradient(
          colors: [
            colors.withOpacity(0.50),
            colors.withOpacity(0.00),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: 4,
            height: 40,
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: colors,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonText(
                  text: 'Car wash',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  bottom: 8,
                ),
                // Task description
                const CommonText(
                  text:
                      'Deep clean service refreshes your car\'s entire interior.',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  bottom: 8,
                ),
                const CommonText(
                  text: 'Due date',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textIcon_200,
                  textAlign: TextAlign.start,
                  bottom: 4,
                ),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                    CommonText(
                      text: 'Wed, 6 Feb 2022',
                      fontSize: 14,
                      left: 4,
                      color: AppColors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
