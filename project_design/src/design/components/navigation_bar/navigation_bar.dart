import 'package:flutter/material.dart';
import '../../../project_design_exports.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key, this.style, required this.items, required this.currentIndex});

  final NavigationBarStyle? style;
  final List<NavigationBarItem> items;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          //final itemW = ((constraints.maxWidth / 2.7)-30);
          final itemW = (constraints.maxWidth - 10) / 3;
          final targetX = itemW * (currentIndex + 0.6); // střed nad aktivní ikonou

          return TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            tween: Tween<double>(end: targetX),
            builder: (context, notchX, child) {
              return PhysicalShape(
                elevation: 10,
                color: Colors.white,
                clipper: _ConcaveNotchClipper(
                  centerX: notchX,
                  index: currentIndex,
                  animation: AlwaysStoppedAnimation(1.0),
                ),
                child: SizedBox(height: 72, child: child),
              );
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: items),
          );
        },
      ),
    );
  }
}

class _ConcaveNotchClipper extends CustomClipper<Path> {
  final double centerX; // X pozice středu výřezu
  final double radius; // poloměr kruhu
  final double depth; // hloubka výřezu (px)
  final double borderRadius; // zaoblení rohů lišty
  final int index;
  final Animation<double> animation; // Animace pro plynulý přechod

  _ConcaveNotchClipper({
    required this.centerX,
    this.radius = 26,
    this.depth = 18 / 2,
    this.borderRadius = 32,
    required this.index,
    required this.animation,
  }) : super(reclip: animation); // Nastavení reclip na animaci

  Path prevNotch = Path();
  Path currentNotch = Path();

  @override
  Path getClip(Size size) {
    final bar = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(borderRadius)));

    final double cx = centerX.clamp(0, size.width);
    const curveRadius = 8.0; // Poloměr zaoblení hran

    final Path initialNotch = Path()
      ..moveTo(cx - radius, 0)
      ..lineTo(cx + radius, 0)
      ..lineTo(cx + radius, depth)
      ..lineTo(cx - radius, depth)
      ..close();

    currentNotch = initialNotch;

    final notch = Path();
    if (index == 0) {
      notch
        ..moveTo(cx - radius, 0) // P1
        ..arcToPoint(Offset(cx - radius / 1.5, depth), radius: const Radius.circular(curveRadius), clockwise: false)
        ..lineTo(cx + radius / 2, depth)
        ..lineTo(cx + radius * 1.1, 0) // P4
        ..close();
    } else if (index == 1) {
      notch
        ..moveTo(cx - radius, 0) // P1
        ..lineTo(cx - radius / 2, depth)
        ..lineTo(cx + radius / 2, depth)
        ..lineTo(cx + radius * 1.1, 0) // Line to P4
        ..close();
    } else if (index == 2) {
      notch
        ..moveTo(cx + radius, 0) // P1 - zrcadlově
        ..arcToPoint(Offset(cx + radius / 1.5, depth), radius: const Radius.circular(curveRadius), clockwise: true)
        ..lineTo(cx - radius / 2, depth)
        ..lineTo(cx - radius * 1.1, 0) // P4 - zrcadlově
        ..close();
    }

    prevNotch = currentNotch;
    currentNotch = notch;

    if (animation.value == 1.0) {
      return Path.combine(PathOperation.difference, bar, currentNotch);
    } else {
      return Path.combine(PathOperation.difference, bar, prevNotch);
    }
  }

  @override
  bool shouldReclip(_ConcaveNotchClipper old) =>
      old.centerX != centerX || old.radius != radius || old.depth != depth || old.borderRadius != borderRadius;
}
