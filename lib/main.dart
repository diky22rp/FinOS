import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/app_theme.dart';
import 'core/service_locator.dart';
import 'routes/app_router.dart';
import 'core/widgets/global_notifier.dart';
import 'firebase_options.dart';
import 'core/providers/global_providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(
    MultiBlocProvider(providers: globalBlocProviders, child: const FinOSApp()),
  );
}

class FinOSApp extends StatelessWidget {
  const FinOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: GlobalNotifier.messengerKey,
      title: 'FinOS',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
