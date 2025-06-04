part of 'example_bloc.dart';

sealed class ExampleEvent extends Equatable {
  const ExampleEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonBlocEvent extends ExampleEvent {
  final String name;
  const GetPokemonBlocEvent(this.name);
}
