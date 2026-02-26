import 'package:finos/features/auth/presentation/pages/sign_in_page.dart';
import 'package:finos/features/auth/presentation/pages/sign_up_page.dart';
import 'package:finos/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:finos/features/main/presentation/main_page.dart';
import 'package:finos/features/profile/presentation/pages/profile_page.dart';
import 'package:finos/features/report/presentation/pages/report_page.dart';
import 'package:finos/features/transaction/presentation/pages/add_transaction_page.dart';
import 'package:finos/features/wallet/presentation/pages/wallet_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SignInPage()),
    GoRoute(path: '/register', builder: (context, state) => const SignUpPage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reports',
              name: 'reports',
              builder: (context, state) => const ReportPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/transactions',
              name: 'transactions',
              builder: (context, state) => const AddTransactionPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/wallet',
              name: 'wallet',
              builder: (context, state) => const WalletPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
