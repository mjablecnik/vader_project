import 'package:project_app/entities/pet.dart';
import 'package:vader_app/vader_app.dart';
import 'package:vader_core/clients/cache_client.dart';

class PetRepository extends Repository {
  PetRepository({required super.httpClient, required super.storageClient});

  Future<List<Pet>> getPets(PetStatus status) async {
    final result = await httpClient.fetch(
      path: '/pet/findByStatus',
      params: {'status': status.name},
      //enableCache: Cache(storageClient: storageClient),
    );

    final List<Pet> petList = Pet.parseListFromJson([...result.data]);
    return petList;
  }
}
