import 'package:dartz/dartz.dart';
import 'package:talkr_chat_app/core/response/response.dart';

abstract class UseCase<T, Type> {
  Future<Either<ResponseI, T>> call(Type params);
}
