import 'dart:ui';

class IndustryModel {
  final String name;
  final int count;
  final Color color;
  final String amount;

  IndustryModel({
    required this.name,
    required this.count,
    required this.color,
    this.amount = "0.0",
  });
}

class IndustryShareModel {
  final String name;
  final int count;
  final Color color;
  final String amount;

  IndustryShareModel({
    required this.name,
    required this.count,
    required this.color,
    this.amount = "0.0",
  });
}