import 'package:flutter/material.dart';
import 'navigation_bar_item.style.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.index,
    required this.icon,
    this.isActive = false,
    required this.onTap,
    this.style,
  });

  final int index;
  final bool isActive;
  final IconData icon;
  final Function(int) onTap;
  final NavigationBarItemStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => onTap.call(index),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 150),
          scale: isActive ? 1.12 : 1.0,
          child: Icon(icon, size: 26, color: isActive ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}
