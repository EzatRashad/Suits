import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const Indicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.dotSize = 8.0,
    this.spacing = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? dotSize * 2 : dotSize,
          height: isActive ? dotSize * 2: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeColor : inactiveColor,
           ),
        );
      }),
    );
  }
}

