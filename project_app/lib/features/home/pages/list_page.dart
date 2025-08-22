import 'package:flutter/material.dart';
import 'package:project_app/features/app/pages/layout_page.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/project_design.dart';
import 'package:vader_app/vader_app.dart';

part 'list_page.g.dart';

@TypedGoRoute<ListRoute>(path: '/list')
class ListRoute extends GoRouteData with _$ListRoute {
  const ListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ListPage());
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return LayoutPage(
      title: "Seznam položek",
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 50,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) => Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.primaries[index % Colors.primaries.length],
                child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
              ),
              title: Text('Položka ${index + 1}'),
              subtitle: const Text('Toto je ukázková položka v seznamu.'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: () {},
            ),
          ),
        ),
    );
  }
}
