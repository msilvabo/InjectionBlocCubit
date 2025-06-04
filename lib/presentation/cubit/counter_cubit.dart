import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/counter_state.dart';
import 'package:inyection_bloc_cubit/presentation/domain/repository/poke_repository.dart';

@lazySingleton
class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._pokeRepository) : super(CounterState.initial());

  final PokeRepository _pokeRepository;

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> getData() async {
    try {
      emit(state.copyWith(status: CounterStatus.loading));
      await Future.delayed(Duration(milliseconds: 1500));
        final pokemon = await _pokeRepository.getPokemon();
        emit(state.copyWith(pokemon: pokemon));
      emit(state.copyWith(status: CounterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CounterStatus.error));
    }
  }
}
