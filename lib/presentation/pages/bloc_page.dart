import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inyection_bloc_cubit/presentation/bloc/bloc/example_bloc.dart';
import 'package:inyection_bloc_cubit/presentation/injection.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final examplebloc = getIt<ExampleBloc>();
    examplebloc.add(GetPokemonBlocEvent("***Example Name***"));
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Example')),
      body: BlocBuilder<ExampleBloc, ExampleState>(
        bloc: examplebloc,
        builder: (context, state) {
          if (state is ExampleBlocInitial) {
            return const Center(child: Text('Initial'));
          }
          if (state is ExampleBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ExampleBlocSucess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pokemon: Ditto', style: TextStyle(fontSize: 25)),
                  ...state.pokemon.abilities.map((e) => Text(e.ability.name)),
                ],
              ),
            );
          }
          if (state is ExampleBlocError){
            return Center(child: Text('Error ${state.error}')); 
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: 
        FloatingActionButton(onPressed: () {
          examplebloc.add(GetPokemonBlocEvent("*** Example Name Refresh ***"));
        },
        child: Icon(Icons.refresh),
        )
    );
  }
}
