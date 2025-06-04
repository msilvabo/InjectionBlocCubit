// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:inyection_bloc_cubit/presentation/cubit/counter_cubit.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/counter_state.dart';
import 'package:inyection_bloc_cubit/presentation/injection.dart';

class CounterListenerPage extends StatelessWidget {
  const CounterListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = getIt<CounterCubit>();
    return Scaffold(
      appBar: AppBar(title: Text('Counter Listener')),
      body: StreamBuilder<CounterState>(
        stream: counterCubit.stream,
        builder: (context, snapshot) {
          final state = snapshot.data ?? counterCubit.state;
          switch (state.status) {
            case CounterStatus.initial:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('initial'),
                    SizedBox(height: 15),
                    Text(
                      'Contador -- ${counterCubit.state.counter}',
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              );
            case CounterStatus.loading:
              return Center(child: CircularProgressIndicator());
            case CounterStatus.success:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contador -- ${counterCubit.state.counter}',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text('Pokemon: Ditto', style: TextStyle(fontSize: 25)),
                    ...state.pokemon!.abilities.map(
                      (e) => Text(e.ability.name),
                    ),
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
        spacing: 10,
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
          FloatingActionButton(
            heroTag: '3',
            child: Icon(Icons.message),
            onPressed: () => _showRefreshDialog(context, counterCubit)
            // onPressed: () {
              // showDialog(
              //   context: context,
              //   builder: (builder) {
              //     return CustomAlert(counterCubit: counterCubit);
              //   },
              // );
            // },
          ),
        ],
      ),
    );
  }

  void _showRefreshDialog(BuildContext context, CounterCubit cubit) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Refrescar Data'),
        actions: [
          ElevatedButton(
            onPressed: () {
              cubit.getData();
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}