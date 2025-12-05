import 'package:vader_server/vader_server.dart';
import 'package:project_backend/clients/ai_client.dart';
import 'package:project_backend/core/error_service.dart';
import 'package:project_backend/clients/surrealdb_client.dart' hide Middleware;

class AppModule extends VaderModule {

  @override
  Future<Injector> services(Injector i) async {
    i.addSingleton(AiClient.new);
    i.addInstance<SurrealDB>(await SurrealDbClient.init());
    i.addSingleton(ErrorService.new);

    return i;
  }

  @override
  List<Controller> get controllers => [];

  @override
  List<Middleware> get middlewares => [logRequests()];
}
