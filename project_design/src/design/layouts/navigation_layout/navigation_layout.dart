import 'package:flutter/material.dart' hide NavigationBar;
import 'package:project_design/design/components/navigation_bar/navigation_bar.dart';
import 'navigation_layout.style.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({super.key, required this.child, this.currentIndex = 0, required this.onTap, this.style});

  final Widget child;
  final int currentIndex;
  final Function(int) onTap;
  final NavigationLayoutStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        currentIndex: 0,
        items: [
          NavigationBarItem(icon: Icons.layers, index: 0, isActive: currentIndex == 0, onTap: onTap),
          NavigationBarItem(icon: Icons.percent, index: 1, isActive: currentIndex == 1, onTap: onTap),
          NavigationBarItem(icon: Icons.person, index: 2, isActive: currentIndex == 2, onTap: onTap),
        ],
      ),
      body: child,
    );
  }
}

/*
class PageIndexProvider extends InheritedNotifier<ValueNotifier<int>> {
  PageIndexProvider({super.key, required int initialIndex, required super.child})
    : super(notifier: ValueNotifier(initialIndex));

  static PageIndexProvider of(BuildContext context) {
    final PageIndexProvider? result = context.dependOnInheritedWidgetOfExactType<PageIndexProvider>();
    assert(result != null, 'No PageIndexProvider found in context');
    return result!;
  }

  int get currentIndex => notifier!.value;

  void setIndex(int newIndex) {
    notifier!.value = newIndex;
  }
}
 */