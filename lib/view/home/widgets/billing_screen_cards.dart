import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_card.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/components/status_badge.dart';

class BillingScreenCards extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String increase;
  final String duration;
  final bool isNegative;

  const BillingScreenCards({
    super.key,
    required this.title,
    required this.value,
    required this.increase,
    required this.duration,
    this.icon = Icons.ac_unit,
    this.isNegative = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
        final isMobile = constraints.maxWidth < 600;
        return Container(
          padding: EdgeInsets.all(isMobile ? 1.5.h : 3.h),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13.sp, color: AppColors.grey),
                    ),
                  ),
                  Icon(
                    icon,
                    size: isMobile ? 18.sp : 13.sp,
                    color: AppColors.grey,
                  ),
                ],
              ),
              Spacer(),
              CustomText(
                text: value,
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  
                  CustomText(
                    text: increase,
                    style: TextStyle(
                      color: isNegative ? Colors.red : Colors.green,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 2),
                  CustomText(
                    text: duration,
                    style: TextStyle(fontSize: 12, color: isNegative ? Colors.red : Colors.green,),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final int companies;
  final String revenue;
  final bool isPopular;

  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.companies,
    required this.revenue,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.boxbg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPopular ? Colors.teal : Colors.grey.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Most Popular Badge + Title + Edit
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isPopular)
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const CustomText(
                        text: "Most Popular",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  CustomText(
                    text: title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.edit_outlined, size: 18),
            ],
          ),

          const SizedBox(height: 15),

          /// Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(width: 4),
              const CustomText(text: "/month"),
            ],
          ),

          const SizedBox(height: 25),

          const CustomText(
            text: "Features:",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),

          const SizedBox(height: 8),

          /// Features
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.green, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomText(
                      text: feature,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),
          const Divider(),

          const SizedBox(height: 10),

          /// Companies
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Companies",
                style: TextStyle(color: AppColors.grey, fontSize: 13),
              ),
              CustomText(text: "$companies"),
            ],
          ),

          const SizedBox(height: 6),

          /// Revenue
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Monthly Revenue",
                style: TextStyle(color: AppColors.grey, fontSize: 13),
              ),
              CustomText(text: revenue),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  FEATURE COMPARISON TABLE
// ─────────────────────────────────────────────
class FeatureComparisonCard extends StatelessWidget {
  const FeatureComparisonCard({super.key});
 
  Widget checkIcon() =>
      const Icon(Icons.check, color: Colors.green, size: 16);
 
  Widget dash() =>
      const Text("—", style: TextStyle(color: Colors.grey, fontSize: 13));
 
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
 
        // On very small screens show a scrollable table
        final table = Table(
          columnWidths: const {
            0: FlexColumnWidth(2.2),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1.2),
            3: FlexColumnWidth(1.2),
          },
          border: TableBorder(
            horizontalInside:
                BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
          children: [
            _headerRow(isMobile),
            _buildRow("Worker Limit",
                _txt("50"), _txt("200"), _txt("Unlimited"), isMobile),
            _buildRow("Rostering",
                checkIcon(), checkIcon(), checkIcon(), isMobile),
            _buildRow("Timesheets",
                checkIcon(), checkIcon(), checkIcon(), isMobile),
            _buildRow("Live Tracking",
                dash(), checkIcon(), checkIcon(), isMobile),
            _buildRow("Advanced Analytics",
                dash(), _txt("Basic"), _txt("Full"), isMobile),
            _buildRow("Custom Integrations",
                dash(), dash(), checkIcon(), isMobile),
            _buildRow("API Access",
                dash(), _txt("Limited"), _txt("Full"), isMobile),
            _buildRow("Support",
                _txt("Email"), _txt("Priority"), _txt("24/7"), isMobile),
          ],
        );
 
        return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Feature Comparison",
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 20),
              isMobile
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 600,
                        child: table,
                      ),
                    )
                  : table,
            ],
          ),
        );
      },
    );
  }
 
  Widget _txt(String text) => CustomText(
        text: text,
        style: const TextStyle(fontSize: 12),
      );
 
  TableRow _headerRow(bool isMobile) {
    return TableRow(
      children: [
        _header("Feature", isMobile, left: true),
        _header("Basic", isMobile),
        _header("Professional", isMobile),
        _header("Enterprise", isMobile),
      ],
    );
  }
 
  Widget _header(String text, bool isMobile, {bool left = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: left ? Alignment.centerLeft : Alignment.center,
        child: CustomText(
          text: text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: isMobile ? 11 : 13,
          ),
        ),
      ),
    );
  }
 
  TableRow _buildRow(String feature, Widget basic, Widget pro, Widget ent,
      bool isMobile) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: CustomText(
            text: feature,
            style: TextStyle(fontSize: isMobile ? 12 : 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Align(alignment: Alignment.center, child: basic),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Align(alignment: Alignment.center, child: pro),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Align(alignment: Alignment.center, child: ent),
        ),
      ],
    );
  }
}
 
// ─────────────────────────────────────────────
//  RECENT INVOICES TABLE
// ─────────────────────────────────────────────
class RecentInvoicesCard extends StatelessWidget {
  const RecentInvoicesCard({super.key});
 
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
 
        final invoiceTable = Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2.5),
            2: FlexColumnWidth(1.5),
            3: FlexColumnWidth(1.2),
            4: FlexColumnWidth(1.3),
            5: FlexColumnWidth(1.5),
          },
          border: TableBorder(
            horizontalInside:
                BorderSide(color: Colors.grey.withOpacity(.2)),
          ),
          children: [
            TableRow(
              children: [
                _header("Invoice ID"),
                _header("Company"),
                _header("Plan"),
                _header("Amount"),
                _header("Status"),
                _header("Date"),
              ],
            ),
            _invoiceRow("INV-2024-0521", "HealthCare Plus",
                _planTag("Enterprise"), "\$4,999", "Paid", "2024-06-15"),
            _invoiceRow("INV-2024-0520", "SecureGuard Services",
                _planTag("Professional"), "\$2,499", "Paid", "2024-06-14"),
            _invoiceRow("INV-2024-0519", "CareConnect NDIS",
                _planTag("Enterprise"), "\$4,999", "Paid", "2024-06-14"),
            _invoiceRow("INV-2024-0518", "FreshFood Catering",
                _planTag("Professional"), "\$2,499", "Paid", "2024-06-13"),
            _invoiceRow("INV-2024-0517", "CleanPro Services",
                _planTag("Basic"), "\$999", "Pending", "2024-06-13"),
            _invoiceRow("INV-2024-0516", "NightWatch Security",
                _planTag("Professional"), "\$2,499", "Overdue", "2024-06-10"),
          ],
        );
 
        return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── HEADER ──
              Row(
                children: [
                  CustomText(
                    text: "Recent Invoices",
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Colors.grey.withOpacity(.5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.download_outlined, size: 14),
                        SizedBox(width: 4),
                        CustomText(
                          text: "Export",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
 
              SizedBox(height: isMobile ? 12 : 16),
 
              // ── TABLE (horizontal scroll on mobile) ──
              isMobile
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 700,
                        child: invoiceTable,
                      ),
                    )
                  : invoiceTable,
            ],
          ),
        );
      },
    );
  }
 
  Widget _header(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: CustomText(
        text: text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
 
  TableRow _invoiceRow(
    String id,
    String company,
    Widget plan,
    String amount,
    String status,
    String date,
  ) {
    return TableRow(
      children: [
        _cell(CustomText(text: id, style: const TextStyle(fontSize: 12))),
        _cell(CustomText(text: company, style: const TextStyle(fontSize: 12))),
        _cell(Row(
          children: [
            plan,Spacer()
          ],
        )),
        _cell(CustomText(
            text: amount, style: const TextStyle(fontSize: 12))),
        _cell(Row(
          children: [
            StatusBadge(text: status),Spacer()
          ],
        )),
        _cell(CustomText(text: date, style: const TextStyle(fontSize: 12))),
      ],
    );
  }
 
  Widget _cell(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: child,
      );
 
  Widget _planTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.withOpacity(.5)),
      ),
      child: CustomText(
        text: text,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
      ),
    );
  }
}