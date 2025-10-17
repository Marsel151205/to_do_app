import 'package:go_router/go_router.dart';
import 'package:to_do_app/features/main/presentation/pages/main_page.dart';

import '../features/auth/login/presentation/pages/login_page.dart';
import '../features/auth/registration/presentation/pages/registration_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
      routes: [
        GoRoute(
          path: '/registration',
          builder: (context, state) => RegistrationPage(),
        ),
        GoRoute(path: '/main', builder: (context, state) => MainPage()),
      ],
    ),
  ],
);
