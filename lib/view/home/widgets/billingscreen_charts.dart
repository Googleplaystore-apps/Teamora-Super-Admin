import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_card.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';

class RevenueByPlanChart extends StatelessWidget {
  RevenueByPlanChart({super.key});

  final List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];

  final List<double> basic        = [35000, 36000, 38000, 40000, 41000, 42000];
  final List<double> professional = [200000, 210000, 225000, 235000, 240000, 245000];
  final List<double> enterprise   = [340000, 365000, 385000, 395000, 398000, 400000];

  /// Minimum width before horizontal scroll kicks in
  static double _minChartWidth = 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile  = constraints.maxWidth < 700;

        // On desktop: fill available width. On smaller screens: fixed scrollable width.
        final double chartWidth = isMobile? _minChartWidth : _minChartWidth+ 200;
        return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Revenue by Plan (6 Months)",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 3.h),

              // ── FIXED Y-AXIS + BAR AREA ──
              SizedBox(
                height: 35.h,
                child: Row(
                  children: [

                    // Fixed Y-axis
                    SizedBox(
                      width: 46,
                      child: BarChart(
                        BarChartData(
                          maxY: 400000,
                          minY: 0,
                          gridData:   const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(toY: 0, width: 0, color: Colors.transparent),
                            ]),
                          ],
                          titlesData: FlTitlesData(
                            topTitles:    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles:  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 100000,
                                reservedSize: 46,
                                getTitlesWidget: (value, meta) => CustomText(
                                  text: "${(value / 1000).toInt()}K",
                                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Bar chart — full width on desktop, scrollable on mobile/tablet
                    Expanded(
                      child: isDesktop 
                          ? _buildBarChart()
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: SizedBox(
                                width: chartWidth,
                                child: _buildBarChart(),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        maxY: 400000,
        minY: 0,

        gridData: FlGridData(
          show: true,
          horizontalInterval: 100000,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.grey.withOpacity(0.5),
            strokeWidth: 1,
            dashArray: [4, 4],
          ),
        ),

        borderData: FlBorderData(
          border: Border(
            left:   BorderSide(color: Colors.grey.withOpacity(0.4)),
            bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
          ),
        ),

        titlesData: FlTitlesData(
          topTitles:   const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles:  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= months.length) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: CustomText(
                    text: months[value.toInt()],
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ),

        barGroups: List.generate(
          months.length,
          (index) => BarChartGroupData(
            x: index,
            barsSpace: 6,
            barRods: [
              BarChartRodData(
                toY: basic[index],
                width: 5.h,
                color: AppColors.green,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
              BarChartRodData(
                toY: professional[index],
                width: 5.h,
                color: AppColors.cyan,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
              BarChartRodData(
                toY: enterprise[index],
                width: 5.h,
                color: AppColors.primary,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
