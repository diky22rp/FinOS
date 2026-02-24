import 'package:finos/features/auth/presentation/pages/sign_in_page.dart';
import 'package:finos/features/auth/presentation/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SignInPage()),
    GoRoute(path: '/register', builder: (context, state) => const SignUpPage()),
  ],
);
