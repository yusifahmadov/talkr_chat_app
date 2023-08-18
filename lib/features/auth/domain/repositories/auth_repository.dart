import 'package:dartz/dartz.dart';
import 'package:talkr_chat_app/core/response/response.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_response.dart';

abstract class AuthRepository {
  Future<Either<ResponseI, AuthResponse>> register(
      String email, String password, bool returnSecureToken);
}
