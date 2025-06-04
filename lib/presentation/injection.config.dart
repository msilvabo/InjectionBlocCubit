// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'bloc/bloc/example_bloc.dart' as _i29;
import 'cubit/counter_cubit.dart' as _i241;
import 'cubit/counter_cubit_without_copywith.dart' as _i105;
import 'cubit/pagination_cubit.dart' as _i41;
import 'cubit/parameter_cubit.dart' as _i271;
import 'cubit/splash_cubit.dart' as _i328;
import 'data/services/poke_api.dart' as _i126;
import 'domain/repository/poke_repository.dart' as _i280;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.lazySingleton<_i126.PokeApi>(() => _i126.PokeApi());
  gh.lazySingleton<_i328.SplashCubit>(() => _i328.SplashCubit());
  gh.lazySingleton<_i271.ParameterCubit>(() => _i271.ParameterCubit());
  gh.lazySingleton<_i280.PokeRepository>(
    () => _i280.PokeRepository(gh<_i126.PokeApi>()),
  );
  gh.lazySingleton<_i105.CounterCubitWithoutcopywith>(
    () => _i105.CounterCubitWithoutcopywith(
      pokeRepository: gh<_i280.PokeRepository>(),
    ),
  );
  gh.lazySingleton<_i29.ExampleBloc>(
    () => _i29.ExampleBloc(pokeRepository: gh<_i280.PokeRepository>()),
  );
  gh.lazySingleton<_i241.CounterCubit>(
    () => _i241.CounterCubit(gh<_i280.PokeRepository>()),
  );
  gh.lazySingleton<_i41.PaginationCubit>(
    () => _i41.PaginationCubit(gh<_i280.PokeRepository>()),
  );
  return getIt;
}
