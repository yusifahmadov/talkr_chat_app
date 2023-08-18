import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkr_chat_app/core/shared_preferences/prefs_helper.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_helper.dart';
import 'package:talkr_chat_app/features/auth/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  RegisterUseCase registerUseCase;
  AuthCubit({required this.registerUseCase}) : super(AuthInitial());

  appIsStarted() async {
    if (SharedPrefsHelper.fromJson("userData") != null) {
      emit(UserAuthenticated());
    }
    emit(UserNotAuthenticated());
  }

  register(AuthHelper authHelper) async {
    final response = await registerUseCase(authHelper);
    response.fold(
        (l) => emit(UserNotAuthenticated()), (r) => emit(UserAuthenticated()));
  }
}
