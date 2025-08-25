import 'dart:io';

import 'package:project_app/config.dart';
import 'package:project_app/features/core/pages/initial_page.dart';
import 'package:project_app/features/core/pages/error_page.dart';
import 'package:flutter/foundation.dart';
import 'package:vader_app/vader_app.dart';

class CoreModule extends VaderModule {
  @override
  List<RouteBase> get routes => [$initialRoute, $errorRoute];

  @override
  Injector? get services {
    final appConfig = AppConfig();
    return Injector()
      ..addInstance(appConfig)
      ..addInstance(HttpClient(apiUrl: appConfig.apiUrl, enableLogs: true, preventLargeResponses: true, kIsWeb: kIsWeb))
      ..addInstance(StorageClient(path: kIsWeb ? null : Directory.systemTemp.path));
  }
}