import 'package:cleanoauth2/main.dart';
import 'package:cleanoauth2/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
    routes: [
      GoRoute(
          path: "/",
          name: MainPage.name,
          builder: (context, state) => MainPage()),
      GoRoute(
          path: "/home",
          name: HomeScreen.name,
          builder: (context, state) => HomeScreen())
]);
