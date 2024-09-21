import 'package:arzonuz/features/arzonuz/auth/data/datasources/auth_datasources.dart';
import 'package:arzonuz/features/arzonuz/card/data/datasources/card_datasources.dart';
import 'package:arzonuz/features/arzonuz/auth/data/repositories/auth_repositories.dart';
import 'package:arzonuz/features/arzonuz/card/data/repository/card_repository.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_forgot_pass_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_logout_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_register_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/domain/usecases/auth_usecasess/auth_reset_usecases.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_add_usecases.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_delete_usecases.dart';
import 'package:arzonuz/features/arzonuz/auth/presentation/bloc/auth_bloc.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_get_usecases.dart';
import 'package:arzonuz/features/arzonuz/card/presentation/blocs/card/card_bloc.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/data/datasource/feedback_datasource.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/data/repository/feedback_repository.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/domain/usecases/feedback_get_usecases.dart';
import 'package:arzonuz/features/arzonuz/feedbacks/presentation/blocs/feedback/feedback_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final shared = await SharedPreferences.getInstance();

  sl.registerFactory(() => AuthBloc(
      authLogoutUsecases: sl<AuthLogoutUsecases>(),
      authResetUsecases: sl<AuthResetUsecases>(),
      authForgotPassUsecases: sl<AuthForgotPassUsecases>(),
      authLoginUsecases: sl<AuthLoginUsecases>(),
      authRegisterUsecase: sl<AuthRegisterUsecases>()));

  sl.registerFactory(
    () => FeedbackBloc(
      feedbackGetUsecases: sl<FeedbackGetUsecases>(),
    ),
  );

  sl.registerFactory(
      () => FeedbackGetUsecases(feedbackRequest: sl<FeedbackRepositoryImpl>()));
  sl.registerFactory(() => FeedbackRepositoryImpl(
      shared: shared, feedbackDatasource: sl<FeedbackDatasource>()));
  sl.registerFactory(() => FeedbackDatasource());

  sl.registerFactory(
    () => AuthLoginUsecases(
      authRepositories: sl<AuthRepositoriesImpl>(),
    ),
  );
  sl.registerFactory(
    () => AuthRegisterUsecases(
      authRepositories: sl<AuthRepositoriesImpl>(),
    ),
  );
  sl.registerFactory(
    () => AuthLogoutUsecases(
      authRepositories: sl<AuthRepositoriesImpl>(),
    ),
  );
  sl.registerFactory(
    () => AuthForgotPassUsecases(
      authRepositories: sl<AuthRepositoriesImpl>(),
    ),
  );
  sl.registerFactory(
    () => AuthResetUsecases(
      authRepositories: sl<AuthRepositoriesImpl>(),
    ),
  );
  sl.registerFactory(
    () => AuthRepositoriesImpl(
      authDatasources: sl<AuthDatasources>(),
    ),
  );

  sl.registerFactory(() => AuthDatasources());

  sl.registerFactory(
    () => CardBloc(
      cardGetUsecases: sl<CardGetUsecases>(),
      cardAddUsecases: sl<CardAddUsecases>(),
      cardDeleteUsecases: sl<CardDeleteUsecases>(),
    ),
  );
  sl.registerFactory(
    () => CardGetUsecases(
      cardRepositoryImpl: sl<CardRepositoryImpl>(),
    ),
  );
  sl.registerFactory(
    () => CardAddUsecases(
      cardRepositories: sl<CardRepositoryImpl>(),
    ),
  );
  sl.registerFactory(
    () => CardRepositoryImpl(
        cardDatasources: sl<CardDatasources>(), shared: shared),
  );
  sl.registerFactory(
    () => CardDatasources(dio: Dio()),
  );
}
