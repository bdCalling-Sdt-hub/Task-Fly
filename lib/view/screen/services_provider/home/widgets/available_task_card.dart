import 'package:flutter/material.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class AvailableTaskCard extends StatelessWidget {
  const AvailableTaskCard({super.key, this.color = Colors.blue});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        gradient: color == Colors.blue
            ? const LinearGradient(
                colors: [
                  Color(0xFF90CAF9),
                  Color(0xFFE3F2FD),
                ],
                begin: Alignment(0.90, -1.90),
                end: Alignment(0.30, -0.10),
              )
            : LinearGradient(
                colors: [
                  color.withOpacity(0.60),
                  color.withOpacity(0.00),
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
              color: color,
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
                      text: 'Wed, 6 Feb 2022, Dhaka',
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
