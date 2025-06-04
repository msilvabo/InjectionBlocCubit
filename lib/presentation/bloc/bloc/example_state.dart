part of 'example_bloc.dart';

sealed class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object> get props => [];
}

final class ExampleBlocInitial extends ExampleState {}

final class ExampleBlocLoading extends ExampleState {}

final class ExampleBlocSucess extends ExampleState {
  final Pokemon pokemon;

  const ExampleBlocSucess({required this.pokemon});
  @override
  List<Object> get props => [];
}
final class ExampleBlocError extends ExampleState {
  final String error;

  const ExampleBlocError({required this.error});
  @override
  List<Object> get props => [];
}
