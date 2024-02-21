import 'package:go_router/go_router.dart';
import 'package:todo_weather/presentation/todo/view/add_todo_screen.dart';
import 'package:todo_weather/presentation/todo/view/todo_details_screen.dart';
import 'package:todo_weather/presentation/todo/view/todo_screen.dart';

abstract class AppPages {
  static const toTodoScreen = '/toTodoScreen';
  static const toTodoDetailsScreen = '/toTodoDetailsScreen';
  static const toAddTodoScreen = '/toAddTodoScreen';
  static const toWeatherScreen = '/toWeatherScreen';

  static final routes = [
    GoRoute(
      path: toTodoScreen,
      builder: (_, __) => const TodoScreen(),
    ),
    GoRoute(
      path: toTodoDetailsScreen,
      builder: (_, __) => const TodoDetailsScreen(),
    ),
    GoRoute(
      path: toAddTodoScreen,
      builder: (_, __) => AddTodoScreen(),
    ),
    GoRoute(
      path: toTodoScreen,
      builder: (_, __) => const TodoScreen(),
    ),
  ];
}
