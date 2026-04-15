import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_card.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/controller/dashboard_clr.dart';
import 'package:teamora/view/home/widgets/custom_icon.dart';

class CompanyGrothIndustryChart extends StatelessWidget {
  var data1 = [12.0, 15.0, 19.0, 21.0, 23.0, 25.0].obs;
  var data2 = [17.0, 20.0, 25.0, 30.0, 34.0, 36.0].obs;
  var data3 = [20.0, 23.0, 30.0, 39.0, 40.0, 42.0].obs;
  var data4 = [25.0, 30.0, 35.0, 45.0, 50.0, 55.0].obs;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 700;
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Industry Breakdown",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3.h),
              SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 60,
                    backgroundColor: Colors.transparent,

                    /// ✅ Grid Styling (Light Dashed)
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 15,
                      getDrawingHorizontalLine: (value) {
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
                          interval: 15,
                          reservedSize: 30,
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
                        spots: data1
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        curveSmoothness: 0.3,
                        color: AppColors.orange,
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
                              strokeColor: AppColors.orange,
                            );
                          },
                        ),

                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: data2
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        curveSmoothness: 0.3,
                        color: AppColors.green,
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
                              strokeColor: AppColors.green,
                            );
                          },
                        ),

                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: data3
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
                        spots: data4
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        curveSmoothness: 0.3,
                        color: AppColors.darkgreen,
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
                              strokeColor: AppColors.darkgreen,
                            );
                          },
                        ),

                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VectorIcon(color: AppColors.darkgreen),
                  SizedBox(width: 3),
                  CustomText(
                    text: 'NDIS',
                    style: TextStyle(fontSize: 13, color: AppColors.darkgreen),
                  ),
                  SizedBox(width: 5),
                  VectorIcon(color: AppColors.cyan),
                  SizedBox(width: 3),
                  CustomText(
                    text: 'Medicine',
                    style: TextStyle(fontSize: 13, color: AppColors.cyan),
                  ),
                  SizedBox(width: 5),
                  VectorIcon(color: AppColors.green),
                  SizedBox(width: 3),
                  CustomText(
                    text: 'Aged Care',
                    style: TextStyle(fontSize: 13, color: AppColors.green),
                  ),
                  SizedBox(width: 5),
                  VectorIcon(color: AppColors.orange),
                  SizedBox(width: 3),
                  CustomText(
                    text: 'Securiyty',
                    style: TextStyle(fontSize: 13, color: AppColors.orange),
                  ),
                ],
              ),
              SizedBox(height: 3),
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

class MarketShareDistributionTable extends StatelessWidget {
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 700;
        final isTablet = w >= 700 && w < 1200;
        final isDesktop = w >= 1200;

        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
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
                    text: "Market Share Distribution",
                    style: TextStyle(
                      fontWeight: FontWeight.bold),
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
                        color: AppColors.primary.withOpacity(0.4),
                        width: .5,
                      ),
                    ),
                    child: CustomText(
                      text: "${controller.totalCompanies} Total",
                      style: TextStyle(fontSize: 10, color: AppColors.primary),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              /// CHART + LEGEND
              IntrinsicHeight(
                // ✅ Aligns children to tallest sibling
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
                              centerSpaceRadius: 40,
                              sections: controller.industriesshare.reversed
                                  .map(
                                    (industryshare) => PieChartSectionData(
                                      value: industryshare.count.toDouble(),
                                      color: industryshare.color,
                                      title: '',
                                      radius: 20,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Legend
                    Flexible(
                      flex: 2,
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.industriesshare.map((
                            industryshare,
                          ) {
                            final percent = controller.getPercentage(
                              industryshare.count,
                            );
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: industryshare.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: isMobile ? 10 : 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: industryshare.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        SizedBox(height: 2),
                                        CustomText(
                                          text:
                                              "${industryshare.count.toString()} companies",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      CustomText(
                                        text: "${percent.toStringAsFixed(1)}%",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      SizedBox(height: 2),
                                      CustomText(
                                        text: industryshare.amount,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
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
            ],
          ),
        );
      },
    );
  }
}

class RevenueComparisonChart extends StatelessWidget {
  RevenueComparisonChart({super.key});

  final List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];

  final List<double> basic = [35000, 36000, 38000, 40000, 41000, 42000];
  final List<double> professional = [
    200000,
    210000,
    225000,
    235000,
    240000,
    245000,
  ];
  final List<double> enterprise = [
    340000,
    365000,
    385000,
    395000,
    398000,
    400000,
  ];

  /// Minimum width before horizontal scroll kicks in
  static double _minChartWidth = 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 700;

        // On desktop: fill available width. On smaller screens: fixed scrollable width.
        final double chartWidth = _minChartWidth + 200;
        return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Revenue Comparison (6 Months)",
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
                          maxY: 200000,
                          minY: 0,
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: 0,
                                  width: 0,
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ],
                          titlesData: FlTitlesData(
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 50000,
                                reservedSize: 46,
                                getTitlesWidget: (value, meta) => CustomText(
                                  text: "${(value / 1000).toInt()}K",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
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
    final List<List<double>> data = [
      [175000, 150000, 135000, 90000, 78000, 48000], // Jan
      [180000, 155000, 138000, 92000, 76000, 49000], // Feb
      [185000, 158000, 140000, 94000, 75000, 50000], // Mar
      [188000, 160000, 142000, 95000, 74000, 50500], // Apr
      [190000, 162000, 145000, 96000, 74500, 51000], // May
      [195000, 165000, 147000, 97000, 75500, 51500], // Jun
    ];

    final colors = [
      AppColors.primary, // NDIS (teal)
      AppColors.cyan, // Medicine (cyan)
      AppColors.green, // Aged Care (green)
      AppColors.orange, // Security (orange)
      AppColors.red, // Food (red)
      AppColors.darkgreen, // Cleaning (dark teal)
    ];

    return Column(
      children: [
        Expanded(
          child: BarChart(
            BarChartData(
              maxY: 200000,
              minY: 0,

              gridData: FlGridData(
                show: true,
                horizontalInterval: 50000,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withOpacity(0.3),
                  strokeWidth: 1,
                  dashArray: [4, 4],
                ),
              ),

              borderData: FlBorderData(
                border: Border(
                  left: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
                ),
              ),

              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= months.length) {
                        return const SizedBox();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          months[value.toInt()],
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              barGroups: List.generate(
                months.length,
                (i) => BarChartGroupData(
                  x: i,
                  barsSpace: 4,
                  barRods: List.generate(
                    6,
                    (j) => BarChartRodData(
                      toY: data[i][j],
                      width: 22,
                      color: colors[j],
                      borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// 🔥 LEGEND
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _legendItem("NDIS", colors[0]),
            _legendItem("Medicine", colors[1]),
            _legendItem("Aged Care", colors[2]),
            _legendItem("Security", colors[3]),
            _legendItem("Food", colors[4]),
            _legendItem("Cleaning", colors[5]),
          ],
        ),
      ],
    );
  }

  Widget _legendItem(String title, Color color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      const SizedBox(width: 6),
      Text(
        title,
        style: TextStyle(fontSize: 11, color: color),
      ),
    ],
  );
}

}
