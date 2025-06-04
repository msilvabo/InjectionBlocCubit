// import 'package:bloc_app/presentation/screen/pages/counter_listener_page.dart';
// import 'package:bloc_app/presentation/screen/pages/counter_page.dart';
// import 'package:bloc_app/presentation/screen/pages/splash/view/splash_page.dart';
// import 'package:bloc_app/presentation/screen/pages/without_copywith_page.dart';
// import 'package:bloc_app/presentation/screen/screen_page.dart';
import 'package:go_router/go_router.dart';
import 'package:inyection_bloc_cubit/presentation/pages/bloc_page.dart';
import 'package:inyection_bloc_cubit/presentation/pages/counter_page.dart';
import 'package:inyection_bloc_cubit/presentation/pages/counter_listener_page.dart';
import 'package:inyection_bloc_cubit/presentation/pages/pagination_page.dart';
import 'package:inyection_bloc_cubit/presentation/pages/screen_page.dart';
import 'package:inyection_bloc_cubit/presentation/pages/splash_page.dart';
import 'package:inyection_bloc_cubit/presentation/pages/without_copywith_page.dart';


final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const ScreenPage(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: '/listener',
      builder: (context, state) => const CounterListenerPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/withoutCopyWith',
      builder: (context, state) => const WithoutCopywithPage(),
    ),
    GoRoute(
      path: '/pagination',
      builder: (context, state) => const PaginationPage(),
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) => const BlocPage(),
    ),
  ]);    