import 'package:project_design/project_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide NavigationBar;

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.style,
    this.navigationIndex,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;
  final int? navigationIndex;
  final PageLayoutStyle? style;

  Widget backButton(BuildContext context) {
    if (!Navigator.canPop(context)) return SizedBox.shrink();

    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Icon(CupertinoIcons.chevron_left, size: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return PageIndexProvider(
      initialIndex: navigationIndex ?? 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          shadowColor: AppColors.grey500,
          toolbarHeight: currentStyle.toolbarHeight,
          backgroundColor: currentStyle.headerColor,
          leading: backButton(context),
          actions: actions,
          title: Text(
            title,
            style: TextStyle(
              color: currentStyle.titleTextColor,
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: currentStyle.backgroundColor,
        bottomNavigationBar: navigationIndex != null ? NavigationBar() : null,
        body: child,
      ),
    );
  }
}

class PageIndexProvider extends InheritedNotifier<ValueNotifier<int>> {
  PageIndexProvider({super.key, required int initialIndex, required super.child})
      : super(notifier: ValueNotifier(initialIndex));

  static PageIndexProvider of(BuildContext context) {
    final PageIndexProvider? result = context.dependOnInheritedWidgetOfExactType<PageIndexProvider>();
    assert(result != null, 'No AppSettingsProvider found in context');
    return result!;
  }

  int get currentIndex => notifier!.value;

  void setIndex(int newIndex) {
    notifier!.value = newIndex;
  }
}
