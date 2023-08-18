import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:talkr_chat_app/core/response/response.dart';
import 'package:talkr_chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_response.dart';
import 'package:talkr_chat_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<ResponseI, AuthResponse>> register(
      String email, String password, bool returnSecureToken) async {
    try {
      return Right(await authRemoteDataSource.register(
          email, password, returnSecureToken));
    } on DioException catch (e) {
      return Left(ResponseI(message: e.toString()));
    }
  }
}
