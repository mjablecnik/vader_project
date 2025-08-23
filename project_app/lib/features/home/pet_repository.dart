import 'package:vader_app/vader_app.dart';

class PetRepository extends Repository {
  PetRepository({required super.httpClient, required super.storageClient});

  Future<String> getPets() async {
    final result = await httpClient.fetch(
      path: '/pet/findByStatus',
      params: {'status': 'available'},
    );
    print((result.data as List).first);
    return Future.value('Hello world');
  }
}
