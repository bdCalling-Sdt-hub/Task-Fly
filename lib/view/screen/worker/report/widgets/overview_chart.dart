import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/text/common_text.dart';

class TaskOverviewChart extends StatelessWidget {
  const TaskOverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(left: 8, bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.s_500,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const CommonText(
            text: AppString.completedTasks,
            fontSize: 20,
            top: 30,
          ).start,
          50.height,
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 16,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('MON');
                          case 1:
                            return const Text('TUE');
                          case 2:
                            return const Text('WED');
                          case 3:
                            return const Text('THU');
                          case 4:
                            return const Text('FRI');
                          case 5:
                            return const Text('SAT');
                          case 6:
                            return const Text('SUN');
                          default:
                            return const Text('');
                        }
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles:
                        SideTitles(showTitles: false), // Removes top titles
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles:
                        SideTitles(showTitles: false), // Removes right titles
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.transparent, width: 1),
                ),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 4,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3),
                      const FlSpot(1, 2),
                      const FlSpot(2, 3.5),
                      const FlSpot(3, 2.8),
                      const FlSpot(4, 3.5),
                      const FlSpot(5, 2.5),
                      const FlSpot(6, 2),
                    ],
                    isCurved: true,
                    color: AppColors.p_500,
                    barWidth: 3,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff394CFF).withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
