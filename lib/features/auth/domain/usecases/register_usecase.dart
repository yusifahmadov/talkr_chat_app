import 'package:dartz/dartz.dart';
import 'package:talkr_chat_app/core/response/response.dart';
import 'package:talkr_chat_app/core/usecase/usecase.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_helper.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_response.dart';
import 'package:talkr_chat_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<AuthResponse, AuthHelper> {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});
  @override
  Future<Either<ResponseI, AuthResponse>> call(params) async {
    return await authRepository.register(params.email, params.password, true);
  }
}
