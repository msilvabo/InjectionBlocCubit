import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/injection.dart';
import 'app/counter/counter_cubit.dart';

void main() {
  configureDependencies(); // Configura get_it
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => getIt<CounterCubit>(), // Obtiene el cubit inyectado
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (_, count) => Text('$count', style: const TextStyle(fontSize: 48)),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: cubit.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: cubit.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}