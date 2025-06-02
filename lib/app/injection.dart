import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'counter/counter_cubit.dart'; // Importa tus cubits

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // Nombre por defecto
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);