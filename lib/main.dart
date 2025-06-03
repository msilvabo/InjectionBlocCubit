import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inyection_bloc_cubit/cubit/counter_cubit.dart';
import 'injection.dart';

void main() {
  configureDependencies(); // Configura get_it
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CounterCubit>(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<CounterCubit>();
    final cubit = getIt<CounterCubit>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder:
              (_, count) =>
                  Text('$count', style: const TextStyle(fontSize: 48)),
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
