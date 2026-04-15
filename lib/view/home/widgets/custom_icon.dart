import 'package:flutter/material.dart';

class VectorIcon extends StatelessWidget {
  // Only the color is passed as a parameter
  final Color color;

  const VectorIcon({
    super.key, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Left Line
        Container(
          width: 5, 
          height: 2, 
          color: color,
        ),
        // The Ring
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: color, 
              width: 2,
            ),
          ),
        ),
        // Right Line
        Container(
          width: 5, 
          height: 2, 
          color: color,
        ),
      ],
    );
  }
}