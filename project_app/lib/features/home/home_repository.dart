import 'package:vader_app/vader_app.dart';

class HomeRepository extends Repository {
  HomeRepository({
    required super.httpClient,
    required super.storageClient,
  });

  Future<String> getSomething() async {
    return Future.value('Hello world');
  }
}
