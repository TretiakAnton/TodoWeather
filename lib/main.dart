import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/core/navigation/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';
import 'package:todo_weather/presentation/weather/bloc/weather_cubit.dart';

void main() {
  runApp(ProvidersWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: AppPages.routes,
      initialLocation: AppPages.toTodoScreen,
      navigatorKey: navigatorKey,
    );
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
    );
  }
}

class ProvidersWidget extends StatelessWidget {
  const ProvidersWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(create: (_) => TodoCubit()..getTodos()),
        BlocProvider<WeatherCubit>(create: (_) => WeatherCubit()),
      ],
      child: child,
    );
  }
}
