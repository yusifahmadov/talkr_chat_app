part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UserAuthenticated extends AuthState {}

class UserNotAuthenticated extends AuthState {}

class UserAuthLoading extends AuthState {}
