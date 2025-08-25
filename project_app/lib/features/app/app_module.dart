import 'package:project_app/features/core/core_module.dart';
import 'package:project_app/features/app/pet_repository.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends CoreModule {
  @override
  List<RouteBase> get routes => [];

  @override
  Injector? get services {
    return super.services!
      ..addSingleton(PetRepository.new);
  }
}
