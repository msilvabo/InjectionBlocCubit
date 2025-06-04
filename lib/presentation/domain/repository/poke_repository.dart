import 'package:inyection_bloc_cubit/presentation/data/models/poke_list_model.dart';
import 'package:inyection_bloc_cubit/presentation/data/models/pokemon_model.dart';
import 'package:inyection_bloc_cubit/presentation/data/services/poke_api.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PokeRepository {
  PokeRepository(this._pokeApi);

  final PokeApi _pokeApi;

  Future<Pokemon> getPokemon() async {
    try {
      return await _pokeApi.getPokemonApi();
    } catch (e) {
      throw Exception(' Get Pokemon Error');
    }
  }

  Future<PokeList> getPokemonList({required int offset}) async {
    try {
      return await _pokeApi.getPokemonList(offset: offset);
    } catch (e) {
      throw Exception(' Get Pokemon Error List');
    }
  }
}
