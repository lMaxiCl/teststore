import 'package:go_router/go_router.dart';
import 'package:teststore/tools/auth.dart';
import 'package:teststore/ui/pages/login/login.dart';
import 'package:teststore/ui/pages/shop/shop.dart';

GoRouter router = GoRouter(routes: [
  ShellRoute(
    builder: (context, state, child) => AuthShell(child),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LogInScaffold(),
      ),
      GoRoute(
        path: '/shop',
        builder: (context, state) => const ShopScaffold(),
      ),
    ],
  ),
]);
