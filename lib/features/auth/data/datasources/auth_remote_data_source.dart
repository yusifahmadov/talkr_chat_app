import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:talkr_chat_app/features/auth/data/models/auth_response_model.dart';
part 'auth_remote_data_source.g.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register(
      String email, String password, bool returnSecureToken);
}

@RestApi(baseUrl: "https://identitytoolkit.googleapis.com/v1/")
abstract class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  factory AuthRemoteDataSourceImpl(Dio dio) = _AuthRemoteDataSourceImpl;

  @override
  @POST("accounts:signUp?key=AIzaSyCewnd4G0MvoXXic92vBPBQu9-f86yhcQo")
  Future<AuthResponseModel> register(
      @Field("email") String email,
      @Field("password") String password,
      @Field("returnSecureToken") bool returnSecureToken);
}
