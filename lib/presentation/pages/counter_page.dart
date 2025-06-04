// import 'package:bloc_app/presentation/screen/cubit/counter_cubit.dart';
// import 'package:bloc_app/presentation/screen/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/counter_cubit.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/counter_state.dart';
import 'package:inyection_bloc_cubit/presentation/injection.dart';

void main() => runApp(const CounterPage());

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = context.read<CounterCubit>();    counterCubit.fakeGetData();
    final counterCubit = getIt<CounterCubit>();
    counterCubit.getData();
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: BlocBuilder<CounterCubit, CounterState>(
        bloc: counterCubit,
        builder: (context, state) {
          switch (state.status) {
            case CounterStatus.initial:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('initial'),
                    SizedBox(height: 15),
                  ],
                ),
              );
            case CounterStatus.loading:
              return Center(child: CircularProgressIndicator());
            case CounterStatus.success:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Contador -- ${state.counter}',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text('NAME:    ${state.pokemon!.abilities.first.ability.name}'),
                    Text('URL:     ${state.pokemon!.abilities.first.ability.url}')
                  ],
                ),
              );
            case CounterStatus.error:
              return Center(child: Text('Error'));
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 25,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: Icon(Icons.add),
            onPressed: () {
              counterCubit.increment();
            },
          ),
          FloatingActionButton(
            heroTag: '2',
            child: Icon(Icons.refresh),
            onPressed: () {
              counterCubit.getData();
            },
          ),
        ],
      ),
    );
  }
}
