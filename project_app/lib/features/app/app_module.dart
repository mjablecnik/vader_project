import 'package:project_app/features/app/logic/pet_list_cubit.dart';
import 'package:project_app/features/app/pages/app_page.dart';
import 'package:project_app/features/core/core_module.dart';
import 'package:project_app/features/app/data/pet_repository.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends CoreModule {
  @override
  List<RouteBase> get routes => [$appPageRoute];

  @override
  Future<Injector> services(Injector i) async {
    i.addSingleton(PetRepository.new);
    i.addSingleton(PetListCubit.new);
    return i;
  }
}
