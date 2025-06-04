// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:inyection_bloc_cubit/presentation/data/models/poke_list_model.dart';

enum PaginationStatus { initial, loading, success, error, complete, loadingMoreError }

class PaginationState extends Equatable {
  final List<Result> pokeNames;
  final PaginationStatus status;

  const PaginationState({
    this.pokeNames = const <Result>[], 
    this.status = PaginationStatus.initial
    });

  @override
  List<Object?> get props => [pokeNames, status];

  PaginationState copyWith({
    List<Result>? pokeNames,
    PaginationStatus? status,
  }) {
    return PaginationState(
      pokeNames: pokeNames ?? this.pokeNames,
      status: status ?? this.status,
    );
  }
}
