import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/components/tilesmanager.dart';
import 'package:teamora/view/home/widgets/billing_screen_cards.dart';
import 'package:teamora/view/home/widgets/billingscreen_charts.dart';
import 'package:teamora/view/home/widgets/sidebar.dart';

class BillingPlans extends StatelessWidget {
  final bool showDrawer;
  const BillingPlans({super.key, this.showDrawer = true});

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
              text: "Billing & Plans",
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
                      childAspectRatio: isMobile ? 3.5 : 3,
                    ),
                    children: [
                      BillingScreenCards(
                        title: "Total Monthly Revenue",
                        icon: Icons.attach_money,
                        value: "\$465K",
                        increase: "+18%",
                        duration: "vs last month",
                      ),
                      BillingScreenCards(
                        title: "Active Subscriptions",
                        icon: Icons.people_alt_outlined,
                        value: "215",
                        increase: "+4",
                        duration: "new this month",
                      ),
                      BillingScreenCards(
                        title: "Average Revenue/Company",
                        icon: Icons.trending_up,
                        value: "\$65K",
                        increase: "+4%",
                        duration: "vs last month",
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      CustomText(
                        text: "Pricing Plans",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.5),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: const CustomText(
                          text: "Manage your subscription packages",
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Wrap(
                    spacing: 20, // horizontal space
                    runSpacing: 20, // vertical space
                    alignment: WrapAlignment.start,
                    children: [
                      ResponsiveCardWrapper(
                        child: PricingCard(
                          title: "Basic",
                          price: "\$999",
                          companies: 42,
                          revenue: "\$41,958",
                          features: [
                            "Up to 50 workers",
                            "Basic rostering",
                            "Timesheets",
                            "Mobile app access",
                            "Email support",
                          ],
                        ),
                      ),

                      ResponsiveCardWrapper(
                        child: PricingCard(
                          title: "Professional",
                          price: "\$2,499",
                          companies: 98,
                          revenue: "\$244,902",
                          isPopular: true,
                          features: [
                            "Up to 200 workers",
                            "Advanced rostering",
                            "Live location tracking",
                            "Timesheets & progress notes",
                            "Billing & invoicing",
                            "Basic analytics",
                            "Priority email support",
                          ],
                        ),
                      ),

                      ResponsiveCardWrapper(
                        child: PricingCard(
                          title: "Enterprise",
                          price: "\$4,999",
                          companies: 79,
                          revenue: "\$394,921",
                          features: [
                            "Unlimited workers",
                            "Full rostering suite",
                            "Live tracking & geofencing",
                            "Advanced timesheets",
                            "Custom billing rules",
                            "Advanced analytics & reports",
                            "Custom integrations",
                            "API access",
                            "Dedicated account manager",
                            "24/7 priority support",
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  RevenueByPlanChart(),
                  SizedBox(height: 20),
                  FeatureComparisonCard(),
                  SizedBox(height: 20),
                  RecentInvoicesCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
