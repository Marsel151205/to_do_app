import 'package:go_router/go_router.dart';
import 'package:to_do_app/features/auth/navigation/auth_routes.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    authRoutes
  ],
);
