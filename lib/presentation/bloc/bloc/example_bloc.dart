import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/data/models/pokemon_model.dart';
import 'package:inyection_bloc_cubit/presentation/domain/repository/poke_repository.dart';

part 'example_event.dart';
part 'example_state.dart';

@lazySingleton
class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({required PokeRepository pokeRepository})
    : _pokeRepository = pokeRepository,
      super(ExampleBlocInitial()) {
    on<GetPokemonBlocEvent>(_onGetPokemonBlocEvent);
  }

  final PokeRepository _pokeRepository;

  Future<void> _onGetPokemonBlocEvent(
    GetPokemonBlocEvent event,
    Emitter<ExampleState> emit,
  ) async {
    try {
      print(event.name);
      emit(ExampleBlocLoading());
      await Future.delayed(Duration(milliseconds: 1000));

      final pokemon = await _pokeRepository.getPokemon();
      emit(ExampleBlocSucess(pokemon: pokemon));
    } catch (e) {
      emit(ExampleBlocError(error: e.toString()));
    }
  }
}
