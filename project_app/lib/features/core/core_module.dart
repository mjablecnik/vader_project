import 'package:project_app/config.dart';
import 'package:project_app/features/core/pages/initial_page.dart';
import 'package:project_app/features/core/pages/error_page.dart';
import 'package:flutter/foundation.dart';
import 'package:vader_app/vader_app.dart';

class CoreModule extends VaderModule {
  @override
  List<RouteBase> get routes => [$initialPageRoute, $errorPageRoute];

  @override
  Future<Injector> services(Injector i) async {
    final appConfig = AppConfig();
    i.addInstance(appConfig);
    i.addInstance(HttpClient(apiUrl: appConfig.apiUrl, enableLogs: true, preventLargeResponses: true, kIsWeb: kIsWeb));
    i.addInstance<StorageClient>(await StorageClient.init(path: (await getApplicationDocumentsDirectory()).path));

    return i;
  }
}
