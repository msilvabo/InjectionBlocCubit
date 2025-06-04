import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/splash_cubit.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/splash_state.dart';
import 'package:inyection_bloc_cubit/presentation/injection.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final splashCubit = getIt<SplashCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Cubit - Splash ')),
      body: BlocListener<SplashCubit, SplashState>(
        bloc: splashCubit,
        listener: (context, state) {
          if (state.status == SplashStatus.success) {
            context.go('/listener');
            splashCubit.init();
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Icons.airplane_ticket, size: 120),
              Text('Redireccionando'),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          splashCubit.success();
        },
        child: Icon(Icons.refresh_outlined),
      ),
    );
  }
}
