import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finos/core/service_locator.dart';

final List<BlocProvider> globalBlocProviders = [
  BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
  // Tambahkan BlocProvider lain di sini jika perlu
];
