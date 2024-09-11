import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/logic/blocs/auth/auth_bloc.dart';
import 'package:arzonuz/logic/blocs/card/card_bloc.dart';
import 'package:arzonuz/logic/blocs/favourite/favourite_bloc.dart';
import 'package:arzonuz/logic/blocs/feedback/feedback_bloc.dart';
import 'package:arzonuz/logic/blocs/product/product_bloc.dart';
import 'package:arzonuz/logic/blocs/user/user_bloc.dart';
import 'package:arzonuz/logic/cubits/button_cubit.dart';
import 'package:arzonuz/logic/cubits/filter_cubit.dart';
import 'package:arzonuz/ui/screens/splash_screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
          create: (context) => AuthBloc(),
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
