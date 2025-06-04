import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/parameter_state.dart';

@lazySingleton
class ParameterCubit extends Cubit<ParameterState> {
  ParameterCubit(): super(const ParameterState());

  void addData(String server, String api, String list) {
    if (server.isEmpty || api.isEmpty) {
      return;
    }
    emit(state.copyWith(server: server, api: api, apiPagination: list));
  }
}
