import 'package:cleanoauth2/main.dart';
import 'package:cleanoauth2/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
    routes: [
      GoRoute(
          path: "/",
          builder: (context, state) => MainPage()),
      GoRoute(
          path: "/home",
          builder: (context, state) => HomeScreen())
]);
