import 'package:go_router/go_router.dart';

import '../features/auth/login/presentation/login_page.dart';
import '../features/auth/registration/presentation/ui/registration_page.dart';

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
      ],
    ),
  ],
);
