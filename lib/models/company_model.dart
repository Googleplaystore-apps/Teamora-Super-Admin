class Company {
  final String name;
  final String joinedDate;
  final String industry;
  final String workers;
  final String plan;
  final String billing;
  final String account;
  final String revenue;
  final dynamic id;
  final String email;
  final String phone;

  Company({
    required this.phone,
    required this.name,
    required this.joinedDate,
    required this.industry,
    required this.workers,
    required this.plan,
    required this.billing,
    required this.account,
    required this.revenue,
    this.id = 0,
    this.email = 'companyemail@example.com',
  });
}