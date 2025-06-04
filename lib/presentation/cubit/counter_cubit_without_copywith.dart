import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/counter_state_without_copywith.dart';
import 'package:inyection_bloc_cubit/presentation/data/models/pokemon_model.dart';
import 'package:inyection_bloc_cubit/presentation/domain/repository/poke_repository.dart';

@lazySingleton
class CounterCubitWithoutcopywith extends Cubit<CounterStateWithoutCopyWith> {
  CounterCubitWithoutcopywith({required PokeRepository pokeRepository})
    : _pokeRepository = pokeRepository,
      super(StateLoading());

  final PokeRepository _pokeRepository;
  late Pokemon pokemon;

  void increment() {
  if (state is StateSuccess) {
    final currentState = state as StateSuccess;
    emit(StateSuccess(
      currentState.pokemon,
      contador: currentState.contador + 1,
    ));
  } else {
    emit(StateSuccess(pokemon, contador: 1));
  } // Si hay un pokemon pero no está en StateSuccess
}

  Future<void> fakeGetData() async {
    // print('fakeGetData');
    try {
      final currentContador =
          state is StateSuccess ? (state as StateSuccess).contador : 10;
      emit(StateLoading());
      await Future.delayed(Duration(milliseconds: 1500), () async {
        pokemon = await _pokeRepository.getPokemon();
        emit(StateSuccess(pokemon, contador: currentContador));
      });
    } catch (e) {
      emit(StateError(e.toString()));
    }
  }
}
