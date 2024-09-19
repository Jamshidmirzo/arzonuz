import 'package:arzonuz/features/arzonuz/data/datasources/auth_datasources.dart';
import 'package:arzonuz/features/arzonuz/data/repositories/auth_repositories.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_login_usecases.dart';
import 'package:arzonuz/features/arzonuz/domain/usecases/auth_register_usecases.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => AuthBloc(
      authLoginUsecases: sl<AuthLoginUsecases>(),
      authRegisterUsecase: sl<AuthRegisterUsecases>()));
  sl.registerFactory(()=>AuthLoginUsecases(authRepositories: sl<AuthRepositoriesImpl>()));
  sl.registerFactory(()=>AuthRegisterUsecases(authRepositories: sl<AuthRepositoriesImpl>()));
  sl.registerFactory(()=>AuthRepositoriesImpl(authDatasources: sl<AuthDatasources>()));
  sl.registerFactory(()=>AuthDatasources());
}
