import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_buttons.dart';
import 'package:teamora/components/app_card.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/controller/dashboard_clr.dart';
import 'package:teamora/view/home/widgets/industry_insight_screen_cards.dart';
import 'package:teamora/view/home/widgets/industry_insight_screen_charts.dart';
import 'package:teamora/view/home/widgets/sidebar.dart';

class IndustryInsightScreen extends StatelessWidget {
  final controller = Get.find<DashboardController>();

  final bool showDrawer;
  IndustryInsightScreen({super.key, this.showDrawer = true});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 700 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 700;
        return Scaffold(
          backgroundColor: AppColors.background,
          drawer: showDrawer ? SideBar() : null,
          appBar: AppBar(
            backgroundColor: AppColors.boxbg,
            automaticallyImplyLeading: showDrawer,
            title: CustomText(
              text: "Industry Insights",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.primary.withOpacity(0.5)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    const CustomText(
                      text: "Super Admin Access",
                      style: TextStyle(fontSize: 10, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 3.w),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(2.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: isDesktop
                            ? MediaQuery.of(context).size.width - 280
                            : MediaQuery.of(context).size.width - 30,
                      ),
                      child: IntrinsicWidth(
                        // 👈 KEY FIX
                        child: CustomCard(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(Icons.filter_alt_outlined),
                              SizedBox(width: 5),
                              CustomText(
                                text: "Industry Analytics Filters",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(width: 50),

                              Spacer(), // ✅ NOW WORKS

                              FilterDropdown(
                                hight: 30,
                                onpressed: () {},
                                icon: Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 16),
                                    SizedBox(width: 5),
                                  ],
                                ),
                                title: 'Last 6 months',
                              ),

                              SizedBox(width: 8),

                              FilterDropdown(
                                hight: 30,
                                onpressed: () {},
                                title: 'Compare Growth',
                              ),

                              SizedBox(width: 8),

                              PrimaryButton(
                                onTap: () {},
                                text: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      CustomText(
                                        text: 'Export Report',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile
                          ? 1
                          : isTablet
                          ? 2
                          : 3,
                      mainAxisSpacing: 1.h,
                      crossAxisSpacing: 1.h,
                      childAspectRatio: isMobile
                          ? 4
                          : isTablet
                          ? 3.5
                          : 3,
                    ),
                    children: [
                      IndustryInsightScreenCards(
                        title: "Total Companies",
                        icon: Icons.apartment,
                        value: '${controller.totalCompanies}',
                        duration: "Across all industries",
                      ),
                      IndustryInsightScreenCards(
                        title: "Total Workers",
                        icon: Icons.people_alt_outlined,
                        value: "${controller.totalWorkers}",
                        duration: "Active workforce",
                      ),
                      IndustryInsightScreenCards(
                        title: "Total Revenue",
                        icon: Icons.trending_up,
                        value: "4784436",
                        duration: "Monthly recurring",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Industry Breakdown",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3.h),
                          Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: const [
                              IndustryBreakdownCard(
                                color: AppColors.primary,
                                title: "NDIS",
                                growth: "+24%",
                                isPositive: true,
                                companies: 52,
                                workers: 2847,
                                revenue: "\$186,548",
                                avg: 55,
                                progress: 0.23,
                              ),
                              IndustryBreakdownCard(
                                color: AppColors.cyan,
                                title: "Medicine",
                                growth: "+18%",
                                isPositive: true,
                                companies: 45,
                                workers: 2156,
                                revenue: "\$165,430",
                                avg: 48,
                                progress: 0.20,
                              ),
                              IndustryBreakdownCard(
                                color: AppColors.green,
                                title: "Aged Care",
                                growth: "+15%",
                                isPositive: true,
                                companies: 38,
                                workers: 1924,
                                revenue: "\$148,762",
                                avg: 51,
                                progress: 0.17,
                              ),
                              IndustryBreakdownCard(
                                color: AppColors.orange,
                                title: "Security",
                                growth: "+12%",
                                isPositive: true,
                                companies: 32,
                                workers: 1567,
                                revenue: "\$98,240",
                                avg: 49,
                                progress: 0.14,
                              ),
                              IndustryBreakdownCard(
                                color: AppColors.darkgreen,
                                title: "Cleaning",
                                growth: "+8%",
                                isPositive: true,
                                companies: 24,
                                workers: 989,
                                revenue: "\$52,450",
                                avg: 41,
                                progress: 0.11,
                              ),
                              IndustryBreakdownCard(
                                color: AppColors.red,
                                title: "Food",
                                growth: "-3%",
                                isPositive: false,
                                companies: 28,
                                workers: 1234,
                                revenue: "\$76,532",
                                avg: 44,
                                progress: 0.12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  isMobile
                      ? Column(
                          children: [
                            CompanyGrothIndustryChart(),
                            SizedBox(height: 20),
                            MarketShareDistributionTable(),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: CompanyGrothIndustryChart()),
                            SizedBox(width: 20),
                            Expanded(child: MarketShareDistributionTable()),
                          ],
                        ),
                  SizedBox(height: 20),
                  RevenueComparisonChart(),
                  SizedBox(height: 20),
                  // 2. Now use them cleanly with responsive layout — no duplication

isMobile
    ? Column(
        mainAxisSize: MainAxisSize.min, // ✅ Critical fix for scrollable context
        children: [
          _topPerformingCard(),
          SizedBox(height: 20),
          _industryInsightsCard(),
        ],
      )
    : IntrinsicHeight( // ✅ Makes both cards equal height in Row
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _topPerformingCard()),
            SizedBox(width: 20),
            Expanded(child: _industryInsightsCard()),
          ],
        ),
      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _insightTile({
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08), // soft background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.25), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          CustomText(
            text: title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 4),

          /// Subtitle
          CustomText(
            text: subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
  // 1. Extract the two cards as reusable widgets to avoid duplication

Widget _topPerformingCard() {
  return CustomCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Top Performing Industries",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 2.h),
        Column(
          children: List.generate(
            controller.industries.take(3).length,
            (index) {
              final industry = controller.industries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.cyan.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: CustomText(
                        text: "${index + 1}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: industry.name,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          CustomText(
                            text: "${industry.count} companies",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.green.withOpacity(0.5)),
                      ),
                      child: CustomText(
                        text: "+${controller.getPercentage(industry.count).toStringAsFixed(0)}%",
                        style: TextStyle(color: AppColors.green, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _industryInsightsCard() {
  return CustomCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // ✅ Fixes unbounded height in Column
      children: [
        Text(
          "Industry Insights",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 2.h), // ✅ Replaced Spacer() — doesn't work in scrollable context
        _insightTile(
          title: "NDIS sector leads growth",
          subtitle: "24% increase in companies, highest worker count",
          color: const Color(0xFF06B6D4),
        ),
        SizedBox(height: 1.5.h),
        _insightTile(
          title: "Medicine & Aged Care stable",
          subtitle: "Consistent growth with high retention rates",
          color: const Color(0xFF10B981),
        ),
        SizedBox(height: 1.5.h),
        _insightTile(
          title: "Food sector needs attention",
          subtitle: "-3% decline, lowest average workers per company",
          color: const Color(0xFFEF4444),
        ),
      ],
    ),
  );
}
}
