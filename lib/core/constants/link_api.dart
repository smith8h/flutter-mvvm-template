class LinkApi {
  static const String baseUrl = 'https://api.escuelajs.co';

  static const String user = '$baseUrl/api/v1/users';
  static const String login = '$user/login';
  static const String logout = '$user/logout';
  static const String refreshToken = '$user/refreshToken';
}