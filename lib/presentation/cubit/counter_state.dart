// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:inyection_bloc_cubit/presentation/data/models/pokemon_model.dart';

enum CounterStatus { initial, loading, success, error }

class CounterState extends Equatable {
  final int counter;
  final CounterStatus status;
  final Pokemon? pokemon;
  const CounterState(this.counter, this.status, this.pokemon);
  
  factory CounterState.initial() => const CounterState(
      10,
      CounterStatus.initial,
      null,
    );

  @override
  List<Object?> get props => [counter, status, pokemon];

  CounterState copyWith({
    int? counter,
    CounterStatus? status,
    Pokemon? pokemon,
  }) {
    return CounterState(
      counter ?? this.counter,
      status ?? this.status,
      pokemon ?? this.pokemon,
    );
  }
}
