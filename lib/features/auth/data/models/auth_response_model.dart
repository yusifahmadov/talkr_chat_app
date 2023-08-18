import 'package:json_annotation/json_annotation.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_response.dart';
part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends AuthResponse {
  AuthResponseModel(
      {required super.expiresIn,
      required super.idToken,
      required super.refreshToken});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
