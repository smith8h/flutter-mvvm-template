class LinkApi {
  static const String baseUrl = 'http://192.168.119.188:5003/API';

  static const String user = '$baseUrl/User';
  static const String login = '$user/login';
  static const String refreshToken = '$user/refresh-token';
  static const String register = '$baseUrl/register';
}