// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

enum SplashStatus { loading, success, error }

class SplashState extends Equatable {
  const SplashState({this.status = SplashStatus.loading});

  final SplashStatus status;

  @override
  List<Object?> get props => [status];

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }
}
