import 'package:vader_server/vader_server.dart';
import 'package:project_backend/core/app_module.dart';
import 'package:project_backend/task/task_module.dart';

Future<void> main(List<String> arguments) async {
  await VaderServer(
    modules: [AppModule(), TaskModule()],
    config: VaderServerConfig(isDebugMode: true),
    mcpConfig: VaderMcpConfig(isDebugMode: true),
  ).run();
}
