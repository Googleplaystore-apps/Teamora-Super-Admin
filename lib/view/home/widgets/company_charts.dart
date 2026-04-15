import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/controller/companies_clr.dart';

class UsageTrendChart extends StatelessWidget {
  final controller = Get.find<CompaniesController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 700;
        return Container(
          padding: EdgeInsets.all(isMobile ? 2.h : 3.5.h),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Usage Trends",
                style: TextStyle(
                  fontSize: isMobile ? 14.sp : 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isMobile ? 3.h : 5.h),
              SizedBox(
                height: isMobile
                    ? 25.h
                    : isTablet
                    ? 30.h
                    : 30.h,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 800,
                    backgroundColor: Colors.transparent,

                    /// ✅ Grid Styling (Light Dashed)
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 150000,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        );
                      },
                    ),

                    /// ✅ Remove Borders
                    borderData: FlBorderData(
                      border: Border(left: BorderSide(), bottom: BorderSide()),
                    ),

                    /// ✅ Axis Titles
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      /// LEFT SIDE NUMBERS
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 200,
                          reservedSize: isMobile ? 25 : 30,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CustomText(
                                text: value.toInt().toString(),
                                style: TextStyle(
                                  fontSize: isMobile ? 12.sp : 10.sp,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      /// BOTTOM MONTHS
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            return _bottomTitleWidgets(value);
                          },
                        ),
                      ),
                    ),

                    /// ✅ Line Styling
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.usagetrend1
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        curveSmoothness: 0.3,
                        color: AppColors.primary,
                        barWidth: 3,
                        isStrokeCapRound: true,

                        /// Dot styling (small circles)
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: AppColors.primary,
                            );
                          },
                        ),

                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: controller.usagetrend2
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        curveSmoothness: 0.3,
                        color: const Color(0xFF03B5FB),
                        barWidth: 3,
                        isStrokeCapRound: true,

                        /// Dot styling (small circles)
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: const Color(0xFF03B5FB),
                            );
                          },
                        ),

                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomTitleWidgets(double value) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    if (value.toInt() < 0 || value.toInt() >= months.length) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: CustomText(
        text: months[value.toInt()],
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class WorkerActivityChart extends StatelessWidget {
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final List<double> values = [45, 32, 28, 24, 38, 52, 78];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isDesktop = constraints.maxWidth >= 1200;
        return Container(
          padding: EdgeInsets.all(isMobile ? 2.h : 3.h),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    text: "Worker Activity(This Week)",
                    style: TextStyle(
                      fontSize: isMobile ? 14.sp : 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 3.h : 5.h),
              SizedBox(
                height: 30.h,
                child: BarChart(
                  BarChartData(
                    minY: 0,
                    maxY: 120,
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                      horizontalInterval: 30,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                          // dashArray: [4, 4],
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      border: Border(left: BorderSide(), bottom: BorderSide()),
                    ),

                    /// ✅ Bottom Titles (Industry Names)
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 30,
                          reservedSize: 40,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value.toInt() >= days.length) {
                              return const SizedBox();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomText(
                                text: days[value.toInt()],
                                style: TextStyle(
                                  fontSize: isMobile ? 13.sp : 11.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    /// ✅ Bars
                    barGroups: List.generate(
                      days.length,
                      (index) => BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: values[index],
                            color: AppColors.primary,
                            width: 5.h,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
