import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/controller/dashboard_clr.dart';

class RevenueChart extends StatelessWidget {
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 600;
        return Container(
          padding: EdgeInsets.all(isMobile ? 2.h : 3.5.h),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Monthly Revenue",
                  style: TextStyle(
                    fontSize: isMobile ? 14.sp : 12.sp, 
                    fontWeight: FontWeight.bold),
                ),
                Obx(() {
                  final percent = controller.revenueChangePercent;
                  final isPositive = controller.isRevenuePositive;
      
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.h,
                      vertical: 0.4.h,
                    ),
                    decoration: BoxDecoration(
                      color: (isPositive ? Colors.green : Colors.red).withOpacity(
                        0.1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: (isPositive ? Colors.green : Colors.red)
                            .withOpacity(0.3),
                        width: .5,
                      ),
                    ),
                    child: CustomText(
                      text:
                          "${isPositive ? "+" : ""}${percent.toStringAsFixed(1)}% YoY",
                      style: TextStyle(
                        fontSize: 11,
                        color: isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: isMobile ? 3.h : 5.h),
            SizedBox(
              height: isMobile ? 25.h : isTablet ? 30.h : 30.h,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 600000,
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
                        interval: 150000,
                        reservedSize: isMobile ? 40 : 50,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              value.toInt().toString(),
                              style:  TextStyle(
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
                      spots: controller.revenueData
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
                  ],
                ),
              ),
            ),
          ],
        ),
      );     }
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

class CompaniesBarChart extends StatelessWidget {
  final List<String> industries = [
    'Medicine',
    'Security',
    'Food',
    'Cleaning',
    'Aged Care',
    'NDIS',
  ];

  final List<double> values = [45, 32, 28, 24, 38, 52];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
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
                  text: "Companies by Industry",
                  style: TextStyle(fontSize: isMobile ? 14.sp : 12.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: isMobile ? 3.h : 5.h),
            SizedBox(
              height: 30.h,
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: 60,
                  gridData: FlGridData(
                    show: true,
                    horizontalInterval: 5,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                        dashArray: [4, 4],
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
                        interval: 10,
                        reservedSize: 30,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= industries.length) {
                            return const SizedBox();
                          }
      
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: CustomText(
                              text: industries[value.toInt()],
                              style: TextStyle(
                                fontSize: isMobile? 13.sp : 11.sp,
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
                    industries.length,
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
      }
    );
  }
}

class IndustryDistributionTable extends StatelessWidget {
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 600;
        final isTablet = w >= 600 && w < 1200;
        final isDesktop = w >= 1200;


        return Container(
          padding: EdgeInsets.all(isMobile ? 2.h : 3.h),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // ✅ Let height be driven by content
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Industry Distribution",
                    style: TextStyle(
                      fontSize: isMobile ? 14.sp : 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 1.5.h : 2.h,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: AppColors.primary.withOpacity(0.4), width: .5),
                    ),
                    child: CustomText(
                      text: "${controller.totalCompanies} Total Companies",
                      style: TextStyle(
                        fontSize: isMobile ? 12.sp : 10.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 3.h : 0.h),

              /// CHART + LEGEND
              IntrinsicHeight( // ✅ Aligns children to tallest sibling
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Donut Chart
                    Flexible(
                      flex: 2, // ✅ Take 2/5 of width
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Obx(
                          () => PieChart(
                            PieChartData(
                              sectionsSpace: 3,
                              centerSpaceRadius: isMobile ? 35 : isTablet ? 40 : 50,
                              sections: controller.industries.reversed
                                  .map((industry) => PieChartSectionData(
                                        value: industry.count.toDouble(),
                                        color: industry.color,
                                        title: "",
                                        radius: isMobile ? 18 : isTablet ? 20 : 25,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: isMobile ? 20 : 30),

                    /// Legend
                    Flexible(
                      flex: 2,
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.industries.map((industry) {
                            final percent =
                                controller.getPercentage(industry.count);
                            return Padding(
                              padding: EdgeInsets.only(bottom: 1.5.h),
                              child: Row(
                                children: [
                                  Container(
                                    width: isMobile ? 8 : 10,
                                    height: isMobile ? 8 : 10,
                                    decoration: BoxDecoration(
                                      color: industry.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: isMobile ? 10 : 20),
                                  Expanded(
                                    child: CustomText(
                                      text: industry.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: isMobile ? 12 : 14),
                                    ),
                                  ),
                                  CustomText(
                                    text: industry.count.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                                  ),
                                  SizedBox(width: isMobile ? 20 : 30),
                                  CustomText(
                                    text: "${percent.toStringAsFixed(1)}%",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: isMobile ? 12 : 14),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 1.h),
              Divider(),
              SizedBox(height: 2.h),

              /// TOP PERFORMING
              CustomText(
                text: "Top Performing Industries",
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 2.h),

              Wrap(
                spacing: 2.h,
                runSpacing: 1.h,
                children: controller.industries
                    .take(2)
                    .map(
                      (industry) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.h,
                          vertical: .5.h,
                        ),
                        decoration: BoxDecoration(
                          color: industry.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: industry.color.withOpacity(0.4),
                              width: .5),
                        ),
                        child: CustomText(
                          text: "${industry.name} – ${industry.count} companies",
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 14,
                            color: industry.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}