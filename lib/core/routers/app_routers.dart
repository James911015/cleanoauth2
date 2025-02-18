import 'package:cleanoauth2/main.dart';
import 'package:cleanoauth2/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screen/form_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: "/", name: MainPage.name, builder: (context, state) => MainPage()),
  GoRoute(
      path: "/home",
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen()),
  GoRoute(
      path: "/form_screen",
      name: FormScreen.name,
      builder: (context, state) => FormScreen())
]);
