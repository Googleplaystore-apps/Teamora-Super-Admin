import 'package:flutter/material.dart';

class ResponsiveCardWrapper extends StatelessWidget {
  final Widget child;
  final double space1;
  final double space2;

  const ResponsiveCardWrapper({
    super.key,
    required this.child,
    this.space1= 30,
     this.space2= 30,
  });

  double _getCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 550) {
      return width; // mobile
    } else if (width > 550 && width < 850) {
      return (width / 2) - space1; // tablet
    } else if (width > 850 && width < 1200) {
      return (width / 3) - space2; // small desktop
    } else {
      return (width / 3.87); // large desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getCardWidth(context),
      child: child,
    );
  }
}