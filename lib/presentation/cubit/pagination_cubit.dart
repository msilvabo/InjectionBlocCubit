import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/pagination_state.dart';
import 'package:inyection_bloc_cubit/presentation/domain/repository/poke_repository.dart';

@lazySingleton
class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit(this._pokeRepository) : super(const PaginationState());

  final PokeRepository _pokeRepository;

  Future<void> getPokemonNames() async {
    if (state.status == PaginationStatus.complete) return;
    if (state.status == PaginationStatus.loading) return;
    if (state.status != PaginationStatus.initial) {
      emit(state.copyWith(status: PaginationStatus.loading));
    }
    try {
      emit(state.copyWith(status: PaginationStatus.loading));
      final pokeResult = await _pokeRepository.getPokemonList(
        offset: state.pokeNames.length,
      );
      if (pokeResult.results.isEmpty) {
        emit(state.copyWith(status: PaginationStatus.complete));
      }
      emit(
        state.copyWith(
          pokeNames: [...state.pokeNames, ...pokeResult.results],
          status: PaginationStatus.success,
        ),
      );
    } catch (e) {
      if(state.status == PaginationStatus.loading){
        emit(state.copyWith(status: PaginationStatus.loadingMoreError));
      } else {
        emit(state.copyWith(status: PaginationStatus.error));
      }
    }
  }
}
