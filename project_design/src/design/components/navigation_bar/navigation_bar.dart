import 'package:flutter/material.dart';
import 'navigation_bar.style.dart';

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
                clipper: _ConcaveNotchClipper1(
                  centerX: notchX,
                  index: currentIndex,
                  animation: AlwaysStoppedAnimation(1.0),
                ),
                // Přidáno animation
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

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.index,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });

  final int index;
  final bool isActive;
  final IconData icon;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
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


class _ConcaveNotchClipper1 extends CustomClipper<Path> {
  final double centerX; // X pozice středu výřezu
  final double radius; // poloměr kruhu
  final double depth; // hloubka výřezu (px)
  final double borderRadius; // zaoblení rohů lišty
  final int index;
  final Animation<double> animation; // Animace pro plynulý přechod

  _ConcaveNotchClipper1({
    required this.centerX,
    this.radius = 26,
    this.depth = 18 / 2,
    this.borderRadius = 32,
    required this.index,
    required this.animation,
  }) : super(reclip: animation); // Nastavení reclip na animaci

  Path prevNotch = Path();
  Path currentNotch = Path();

  // @override
  // Path getClip(Size size) {
  //   final bar = Path()
  //     ..addRRect(RRect.fromRectAndRadius(
  //       Offset.zero & size,
  //       Radius.circular(borderRadius),
  //     ));

  //   // střed kruhu – záporná Y posune kruh nahoru, takže se do lišty "zakousne" jen část
  //   final cx = centerX.clamp(radius, size.width - radius);
  //   final cy = depth - radius; // pro danou hloubku d platí centerY = d - r
  //   final notch = Path()
  //     ..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: radius));

  //   // odečti kruh z pilulky
  //   return Path.combine(PathOperation.difference, bar, notch);
  // }
  @override
  Path getClip(Size size) {
    final bar = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(borderRadius)));

    // střed kruhu – záporná Y posune kruh nahoru, takže se do lišty "zakousne" jen část
    final double cx = centerX.clamp(0, size.width);
    const curveRadius = 8.0; // Poloměr zaoblení hran

    // Interpolace tvaru výřezu na základě animace
    // Můžete experimentovat s různými způsoby interpolace bodů
    // pro dosažení různých efektů přechodu.
    // Zde je jednoduchý příklad lineární interpolace.

    // Výchozí tvar (např. obdélník nebo žádný výřez)
    final Path initialNotch = Path()
      ..moveTo(cx - radius, 0)
      ..lineTo(cx + radius, 0)
      ..lineTo(cx + radius, depth)
      ..lineTo(cx - radius, depth)
      ..close();

    currentNotch = initialNotch;

    // Cílový tvar (aktuální tvar výřezu)
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

    // Nelze zde použít Path.lerp přímo, protože potřebujeme interpolovat body.
    // Místo toho vytvoříme nový Path s interpolovanými body.
    final interpolatedNotch = Path();
    final t = animation.value;

    // Příklad interpolace pro první bod (moveTo)
    // Pro ostatní body (lineTo, arcToPoint) by se postupovalo obdobně.
    // Toto je zjednodušený příklad a pro komplexní tvary může být nutné
    // interpolovat každý parametr (x, y, radius, angles atd.) zvlášť.

    // V tomto případě, jelikož Path.lerp není vhodné,
    // a přímá interpolace bodů je komplexní,
    // pro účely tohoto příkladu vrátíme přímo 'notch' pokud je animace na konci,
    // jinak 'initialNotch'. Pro plynulejší přechod by byla potřeba detailnější interpolace.

    if (animation.value == 1.0) {
      return Path.combine(PathOperation.difference, bar, currentNotch);
    } else {
      return Path.combine(PathOperation.difference, bar, prevNotch);
    }
    //return Path.combine(PathOperation.difference, bar, notch);
  }

  @override
  bool shouldReclip(_ConcaveNotchClipper1 old) =>
      old.centerX != centerX || old.radius != radius || old.depth != depth || old.borderRadius != borderRadius;
}
