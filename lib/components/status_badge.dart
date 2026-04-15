import 'package:flutter/material.dart';
import 'package:teamora/components/app_text.dart';

class StatusBadge extends StatelessWidget {
  final String text;

  const StatusBadge({super.key, required this.text});

  Color _getColor() {
    switch (text.toLowerCase()) {
      case "paid":
      case "active":
        return Colors.green;
      case "professional":
        return Colors.blue;
      case "enterprise":
        return Colors.teal;
      case "basic":
        return Colors.grey;
      case "expiring":
      case "pending":
        return Colors.orange;
      case "overdue":
      case "suspended":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.5), width: 0.5),
      ),
      child: CustomText(
        text: text,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}