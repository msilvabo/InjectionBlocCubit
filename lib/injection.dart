import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // Nombre por defecto
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);