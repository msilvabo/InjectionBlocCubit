import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/pagination_cubit.dart';
import 'package:inyection_bloc_cubit/presentation/cubit/pagination_state.dart';
// import 'package:inyection_bloc_cubit/presentation/cubit/parameter_cubit.dart';
import 'package:inyection_bloc_cubit/presentation/injection.dart';

class PaginationPage extends StatefulWidget {
  const PaginationPage({super.key});

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    // print('... ${maxScroll - currentScroll}');
    if (maxScroll - currentScroll <= 100 &&
        !_scrollController.position.outOfRange) {
      paginationCubit.getPokemonNames();
    }
  }

  final paginationCubit = getIt<PaginationCubit>();

  @override
  Widget build(BuildContext context) {
    // final parameterCubit = getIt<ParameterCubit>();
    paginationCubit.getPokemonNames();
    return Scaffold(
      appBar: AppBar(title: Text('Pagination')),
      body: BlocBuilder<PaginationCubit, PaginationState>(
        buildWhen: (previous, current) {
          return current.status != PaginationStatus.loading || current.status != PaginationStatus.loadingMoreError;
        },
        bloc: paginationCubit,
        builder: (context, state) {
          switch (state.status) {
            case PaginationStatus.initial:
              return Center(child: Text('Inicial'));
            case PaginationStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PaginationStatus.success:
            case PaginationStatus.complete:
            case PaginationStatus.loadingMoreError:
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.pokeNames.length,
                itemBuilder: (BuildContext context, int index) {
                  final pokeName = state.pokeNames[index];
                  return ListTile(
                    title: Text(
                      "Orden $index: ${pokeName.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(pokeName.url),
                  );
                },
              );
            case PaginationStatus.error:
              return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
