import 'package:project_app/features/app/app_module.dart';
import 'package:project_app/features/home/pet_repository.dart';
import 'package:vader_app/vader_app.dart';

class HomeModule extends AppModule {
  @override
  List<RouteBase> get routes => [];

  @override
  Injector? get services {
    return super.services!
      ..addSingleton(PetRepository.new);
  }
}
