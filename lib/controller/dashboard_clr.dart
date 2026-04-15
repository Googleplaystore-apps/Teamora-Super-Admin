import 'dart:ui';

import 'package:get/get.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/models/industry_model.dart';

class DashboardController extends GetxController {
  var totalWorkers = 8247.obs;
  var monthlyRevenue = 465000.0.obs;
  var activeSubscriptions = 215.obs;

  var revenueData = [
    250000.0,
    275000.0,
    315000.0,
    350000.0,
    395000.0,
    420000.0,

  ].obs;

  double get revenueChangePercent {
    if (revenueData.length < 2) return 0;

    double first = revenueData.first;
    double last = revenueData.last;

    if (first == 0) return 0;

    return ((last - first) / first) * 100;
  }

  bool get isRevenuePositive => revenueChangePercent >= 0;

  final industries = [
  IndustryModel(name: "NDIS", count: 52, color: Color(0xFF4F46E5)),
  IndustryModel(name: "Medicine", count: 45, color: Color(0xFF06B6D4)),
  IndustryModel(name: "Aged Care", count: 38, color: Color(0xFF10B981)),
  IndustryModel(name: "Security", count: 32, color: Color(0xFFF59E0B)),
  IndustryModel(name: "Food", count: 28, color: Color(0xFFEF4444)),
  IndustryModel(name: "Cleaning", count: 24, color: Color(0xFF8B5CF6)),
].obs;

  final industriesshare = [
  IndustryShareModel(name: "NDIS", count: 52, color: AppColors.primary, amount: '\$187K'),
  IndustryShareModel(name: "Medicine", count: 45, color: AppColors.cyan, amount: '\$164K'),
  IndustryShareModel(name: "Aged Care", count: 38, color: AppColors.green, amount: '\$147K'),
  IndustryShareModel(name: "Security", count: 32, color: AppColors.orange, amount: '\$107K'),
  IndustryShareModel(name: "Food", count: 28, color: AppColors.red, amount: '\$89K'),
  IndustryShareModel(name: "Cleaning", count: 24, color: AppColors.darkgreen, amount: '\$77K'),
].obs;

int get totalCompanies =>
    industries.fold(0, (sum, item) => sum + item.count);

double getPercentage(int count) =>
    (count / totalCompanies) * 100;
}
