import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/bloc/auth_bloc.dart';
import 'package:arzonuz/features/arzonuz/card/presentation/blocs/card/card_bloc.dart';
import 'package:arzonuz/features/arzonuz/favourite/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/presentation/blocs/feedback/feedback_bloc.dart';
import 'package:arzonuz/features/arzonuz/process/presentation/process/process_bloc.dart';
import 'package:arzonuz/features/arzonuz/product/presentation/bloc/product_bloc.dart';
import 'package:arzonuz/features/arzonuz/profile/presentation/blocs/user/user_bloc.dart';
import 'package:arzonuz/features/arzonuz/fliter/presentation/cubits/button_cubit.dart';
import 'package:arzonuz/features/arzonuz/fliter/presentation/cubits/filter_cubit.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/pages/splash_screen/splash_screen.dart';
import 'package:arzonuz/sevice_locator.dart';
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
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => sl<CardBloc>(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => sl<FeedbackBloc>(),
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
