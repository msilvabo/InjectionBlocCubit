
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/splash_state.dart';

@lazySingleton
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void success() {
    emit(state.copyWith(status: SplashStatus.loading));
    Future.delayed(const Duration(seconds: 3), () {
      emit(state.copyWith(status: SplashStatus.success));
    });
  }
  void init() {
      emit(state.copyWith(status: SplashStatus.loading));
  }
}
