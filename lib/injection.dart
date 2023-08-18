import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkr_chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:talkr_chat_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:talkr_chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:talkr_chat_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:talkr_chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:talkr_chat_app/features/main/presentation/utility/text_field_obscure_checker.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  await initCubits();
  await initDataSources();
  await initUseCases();
  await initExternals();
  await initRepositories();
}

initCubits() async {
  getIt.registerFactory(() => AuthCubit(registerUseCase: getIt()));
  getIt.registerFactory(() => TextFieldObscureChecker());
}

initUseCases() async {
  getIt.registerLazySingleton(() => RegisterUseCase(authRepository: getIt()));
}

initDataSources() async {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()));
}

initRepositories() async {
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: getIt()));
}

final navigatorKey = GlobalKey<NavigatorState>();
final mainContext = navigatorKey.currentContext;

initExternals() async {
  getIt.registerLazySingleton(() => navigatorKey);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>();
}
