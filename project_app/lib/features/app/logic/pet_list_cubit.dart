import 'package:project_app/features/app/data/pet.dart';
import 'package:project_app/features/app/logic/pet_list_state.dart';
import 'package:project_app/features/app/data/pet_repository.dart';
import 'package:vader_app/vader_app.dart';

class PetListCubit extends Cubit<PetListState> {
  PetListCubit({required this.petRepository}): super(PetListState.init()) {
    loadPets();
  }

  late final PetRepository petRepository;

  void update(PetListState state) {
    emit(state);
  }

  Future<void> loadPets() async {
    update(PetListState.loading());
    try {
      final pets = await petRepository.getPets(PetStatus.available);
      update(PetListState.loaded(pets));
    } catch (e) {
      update(PetListState.failed(e));
    }
  }
}
