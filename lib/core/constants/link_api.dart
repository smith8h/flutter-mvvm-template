class LinkApi {
  // static const String baseUrl = 'http://192.168.119.188:5003/API'; // real phone api link
  static const String baseUrl = 'http://back.teama.info'; // real phone api link
  // static const String baseUrl = 'http://10.0.0.2:5003/API'; // emulator api link

  static const String user = '$baseUrl/API/User';
  static const String login = '$user/login';
  static const String refreshToken = '$user/refresh-token';
  static const String register = '$user/register';

  static const String task = '$baseUrl/API/task';
  static const String leaderTasks = '$task/leadertasks';
}