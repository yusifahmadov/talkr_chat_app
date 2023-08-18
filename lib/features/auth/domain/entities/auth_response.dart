class AuthResponse {
  final String idToken;
  final String refreshToken;
  final String expiresIn;

  const AuthResponse({
    required this.expiresIn,
    required this.idToken,
    required this.refreshToken,
  });
}
