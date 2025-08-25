import 'package:project_app/entities/pet.dart';
import 'package:vader_app/vader_app.dart';

part 'pet_list_state.freezed.dart';

@freezed
sealed class PetListState with _$PetListState {
  const PetListState._();

  const factory PetListState.init([List<Pet>? petList]) = PetListStateInit;

  const factory PetListState.loading() = PetListStateLoading;

  const factory PetListState.failed(dynamic error) = PetListStateFailed;

  const factory PetListState.loaded(List<Pet> petList) = PetListStateLoaded;

}
