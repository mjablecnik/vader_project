import 'package:flutter/material.dart';
import 'package:project_app/features/app/logic/pet_list_cubit.dart';
import 'package:project_app/features/app/logic/pet_list_state.dart';
import 'package:project_app/features/core/pages/layout_page.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:vader_app/vader_app.dart';

part 'pet_list_page.g.dart';

@TypedGoRoute<PetListRoute>(path: '/pets')
class PetListRoute extends GoRouteData with _$PetListRoute {
  const PetListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: PetListPage());
  }
}

class PetListPage extends StatelessWidget {
  const PetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return LayoutPage(
      title: "Seznam položek",
      child: BlocBuilder<PetListCubit, PetListState>(
        bloc: injector.use<PetListCubit>(),
        builder: (context, state) {
          switch (state) {
            case PetListStateInit():
            case PetListStateLoading():
              return const Text("Loading..");
            case PetListStateFailed():
              return Text("Error: ${state.error}");
            case PetListStateLoaded():
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.petList.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final pet = state.petList[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.primaries[index % Colors.primaries.length],
                        child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(pet.name),
                      subtitle: pet.tags.isEmpty ? null : Text('Tags: ${pet.tags.join(', ')}'),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () {},
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
