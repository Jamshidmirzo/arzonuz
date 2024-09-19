import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/features/arzonuz/data/datasources/auth_datasources.dart';
import 'package:arzonuz/features/arzonuz/data/repositories/auth_repositories.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_register_usecases.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/auth/auth_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/card/card_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/feedback/feedback_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/process/process_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/product/product_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/user/user_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/cubits/button_cubit.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/cubits/filter_cubit.dart';
import 'package:arzonuz/features/arzonuz/presentation/pages/splash_screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sevice_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('uz'),
        Locale('en'),
      ],
      path: 'resources/langs',
      fallbackLocale: const Locale('uz'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonCubit(),
        ),
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            authRegisterUsecase: AuthRegisterUsecases(
              authRepositories:
                  AuthRepositoriesImpl(authDatasources: AuthDatasources()),
            ),
            authLoginUsecases: AuthLoginUsecases(
              authRepositories:
                  AuthRepositoriesImpl(authDatasources: AuthDatasources()),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => CardBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => FeedbackBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider(
          create: (context) => ProcessBloc(),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
