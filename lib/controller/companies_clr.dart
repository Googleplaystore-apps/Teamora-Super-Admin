import 'package:get/get.dart';
import '../models/company_model.dart';

class CompaniesController extends GetxController {

  /// Companies List
  final companies = <Company>[].obs;

  /// Search Text
  final searchQuery = "".obs;

  /// Filters
  final selectedIndustry = "All Industries".obs;
  final selectedPlan = "All Plans".obs;
  final selectedStatus = "All Statuses".obs;

  @override
  void onInit() {
    super.onInit();
    loadCompanies();
  }

  void loadCompanies() {
    companies.value = [
      Company(
        name: "HealthCare Plus",
        joinedDate: "15 02 2023",
        industry: "Medicine",
        workers: "124",
        plan: "Enterprise",
        billing: "Paid",
        account: "Active",
        revenue: "\$4,999/mo",
        email: "admin@healthcareplus.com",
        id: "HC12345",
        phone: "88754678555"
      ),
      Company(
        name: "SecureGuard Services",
        joinedDate: "10 03 2023",
        industry: "Security",
        workers: "89",
        plan: "Professional",
        billing: "Paid",
        account: "Active",
        revenue: "\$2,499/mo",
        email: "admin@secureguard.com",
        id: "SG67890",
        phone: "88754678555"
      ),
      Company(
        name: "EduTech Innovations",
        joinedDate: "05 01 2023",
        industry: "Education",
        workers: "45",
        plan: "Basic",
        billing: "Expiring",
        account: "Active",
        revenue: "\$499/mo",
        email: "admin@edutech.com",
        id: "ET11223",
        phone: "88754678555"
      ),
      Company(
        name: "GreenEnergy Solutions",
        joinedDate: "20 02 2023",
        industry: "Energy",
        workers: "67",
        plan: "Professional",
        billing: "Overdue",
        account: "Suspended",
        revenue: "\$1,199/mo",
        email: "admin@greenenergy.com",
        id: "GE45678",
        phone: "88754678555"
      ),
      Company(
      name: "HealthCare Plus",
      joinedDate: "15 02 2023",
      industry: "Medicine",
      workers: "124",
      plan: "Enterprise",
      billing: "Paid",
      account: "Active",
      revenue: "\$4,999/mo",
      email: "admin@healthcareplus.com",
      id: "HC12345",
      phone: "88754678555"
    ),
    Company(
      name: "SecureGuard Services",
      joinedDate: "10 03 2023",
      industry: "Security",
      workers: "89",
      plan: "Professional",
      billing: "Paid",
      account: "Active",
      revenue: "\$2,499/mo",
      email: "admin@secureguard.com",
      id: "SG67890",
      phone: "88754678555"
    ),
    Company(
      name: "EduTech Innovations",
      joinedDate: "05 01 2023",
      industry: "Education",
      workers: "45",
      plan: "Basic",
      billing: "Expiring",
      account: "Active",
      revenue: "\$499/mo",
      email: "admin@edutech.com",
      id: "ET11223",
      phone: "88754678555"
    ),
    Company(
      name: "GreenEnergy Solutions",
      joinedDate: "20 02 2023",
      industry: "Energy",
      workers: "67",
      plan: "Professional",
      billing: "Overdue",
      account: "Suspended",
      revenue: "\$1,199/mo",
      email: "admin@greenenergy.com",
      id: "GE45678",
      phone: "88754678555"
    ),
    Company(
      name: "FinTech Innovators",
      joinedDate: "12 03 2023",
      industry: "Finance",
      workers: "102",
      plan: "Enterprise",
      billing: "Paid",
      account: "Active",
      revenue: "\$5,499/mo",
      email: "admin@fintech.com",
      id: "FT33445",
      phone: "88754678555"
    ),
    Company(
      name: "TechSolutions Inc",
      joinedDate: "08 04 2023",
      industry: "Technology",
      workers: "75",
      plan: "Professional",
      billing: "Paid",
      account: "Active",
      revenue: "\$3,299/mo",
      email: "admin@techsolutions.com",
      id: 'FH7587',
      phone: "88754678555"
    ),
    Company(
      name: "DataSystems Ltd",
      joinedDate: "15 05 2023",
      industry: "Data",
      workers: "92",
      plan: "Basic",
      billing: "Paid",
      account: "Active",
      revenue: "\$1,999/mo",
      email: "admin@datasystems.com",
      id: "DS90123",
      phone: "88754678555"
    ),
    Company(
      name: "HealthCare Plus",
      joinedDate: "15 02 2023",
      industry: "Medicine",
      workers: "124",
      plan: "Enterprise",
      billing: "Paid",
      account: "Active",
      revenue: "\$4,999/mo",
      email: "admin@healthcareplus.com",
      id: "HC12345",
      phone: "88754678555"
    ),
    Company(
      name: "TechSolutions Inc",
      joinedDate: "08 04 2023",
      industry: "Technology",
      workers: "75",
      plan: "Professional",
      billing: "Paid",
      account: "Active",
      revenue: "\$3,299/mo",
      email: "admin@techsolutions.com",
      id: 'FH7587',
      phone: "88754678555"
    ),
    Company(
      name: "DataSystems Ltd",
      joinedDate: "15 05 2023",
      industry: "Data",
      workers: "92",
      plan: "Basic",
      billing: "Paid",
      account: "Active",
      revenue: "\$1,999/mo",
      email: "admin@datasystems.com",
      id: "DS90123",
      phone: "88754678555"
    ),
    ];
  }

  var usagetrend1 = [
    245.0,
    300.0,
    325.0,
    400.0,
    425.0,
    445.0,

  ].obs;

  var usagetrend2 = [
    445.0,
    500.0,
    525.0,
    590.0,
    625.0,
    745.0,

  ].obs;

  /// Filtered List
  List<Company> get filteredCompanies {

    var list = companies;

    /// Search
    if (searchQuery.value.isNotEmpty) {
      list = list
          .where((c) =>
              c.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList()
          .obs;
    }

    /// Industry Filter
    if (selectedIndustry.value != "All Industries") {
      list = list
          .where((c) => c.industry == selectedIndustry.value)
          .toList()
          .obs;
    }

    /// Plan Filter
    if (selectedPlan.value != "All Plans") {
      list =
          list.where((c) => c.plan == selectedPlan.value).toList().obs;
    }

    /// Status Filter
    if (selectedStatus.value != "All Statuses") {
      list =
          list.where((c) => c.account == selectedStatus.value).toList().obs;
    }

    return list;
  }

  /// Search
  void searchCompany(String value) {
    searchQuery.value = value;
  }

  /// Filter Setters
  void setIndustry(String value) {
    selectedIndustry.value = value;
  }

  void setPlan(String value) {
    selectedPlan.value = value;
  }

  void setStatus(String value) {
    selectedStatus.value = value;
  }

}