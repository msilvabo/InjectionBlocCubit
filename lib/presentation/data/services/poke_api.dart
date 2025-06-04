import 'package:dio/dio.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/parameter_cubit.dart';
import 'package:inyection_bloc_cubit/presentation/data/models/poke_list_model.dart';
import 'package:inyection_bloc_cubit/presentation/data/models/pokemon_model.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/injection.dart';

@lazySingleton
class PokeApi {
  final Dio dio = Dio();
  // final String server = 'https://pokeapi.co/api/v2/';
  // final String endpoint = 'pokemon/ditto';
  final parameterCubit = getIt<ParameterCubit>().state;

  Future<Pokemon> getPokemonApi() async {
    try {
      final response = await dio.get(
        '${parameterCubit.server}${parameterCubit.api}',
      );
      return Pokemon.fromJson(response.data);
    } catch (e) {
      throw Exception('Gepo Pokemon Api - error');
    }
  }

  Future<PokeList> getPokemonList({required int offset}) async {
    try {
      final response = await dio.get(
        '${parameterCubit.server}${parameterCubit.apiPagination}$offset',
      );
      return PokeList.fromJson(response.data);

    } on DioException catch (e, stackTrace) {
      print('❌ DioException en getPokemonList');
      print('➡️ URL: ${e.requestOptions.uri}');
      print('📡 Status code: ${e.response?.statusCode}');
      print('📦 Response data: ${e.response?.data}');
      print('🧾 Message: ${e.message}');
      print('📍 StackTrace: $stackTrace');
      rethrow;
    } catch (e) {
      throw Exception('Gepo Pokemon List - error');
    }
  }
}
