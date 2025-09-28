import 'package:go_router/go_router.dart';
import 'package:to_do_app/features/auth/login/presentation/login_page.dart';
import 'package:to_do_app/features/auth/registration/presentation/registration_page.dart';

final authRoutes = GoRoute(
  path: '/login',
  builder: (context, state) => LoginPage(),
  routes: [
    GoRoute(
      path: '/registration',
      builder: (context, state) => RegistrationPage(),
    ),
  ],
);
