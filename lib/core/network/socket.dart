
import 'package:hive_flutter/adapters.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:widgets/core/constants/strings.dart';
import 'package:widgets/core/utils/print_value.dart';

class SocketService {
  late HubConnection _hubConnection;

  Future<void> startService(String api) async {
    String accessToken = await Hive.box(Strings.keyDb).get(Strings.keyAccessToken);

    _hubConnection = HubConnectionBuilder()
        .withUrl(api, HttpConnectionOptions(accessTokenFactory: () async => accessToken, transport: HttpTransportType.webSockets))
        .withAutomaticReconnect()
        .build();

    _startConnection();

    _hubConnection.onclose((error) {
      dprint(tag: 'Socket', 'Connection Closed: $error');
      _startConnection();
    });

    _hubConnection.onreconnecting((error) {
      dprint(tag: 'Socket', 'Reconnecting: $error');
    });

    _hubConnection.onreconnected((connectionId) {
      dprint(tag: 'Socket', 'Reconnected with connectionId: $connectionId');
    });
  }

  void listen(String eventName, Function(dynamic) callback) {
    _hubConnection.on(eventName, (message) {
      dprint(tag: 'Socket', 'Received event: $eventName - $message');
      callback(message);
    });
  }

  void stopListening(String eventName) {
    _hubConnection.off(eventName);
    dprint(tag: 'Socket', 'Stopped listening to event: $eventName');
  }

  Future<void> invoke(String methodName, {List<dynamic>? args}) async {
    if (_hubConnection.state != HubConnectionState.connected) {
      dprint(tag: 'Socket', 'Connection is not in the Connected state');
      _startConnection();
    }

    try {
      await _hubConnection.invoke(methodName, args: args);
      dprint(tag: 'Socket', 'Method "$methodName" invoked successfully, args: $args');
    } catch (e) {
      dprint(tag: 'Socket', 'Failed to invoke method "$methodName": $e');
      await _startConnection();
      rethrow;
    }
  }

  Future<void> _startConnection() async {
    try {
      await _hubConnection.start();
      dprint(tag: 'Socket', 'Connected with connectionID: ${_hubConnection.connectionId}');
    } catch (e) {
      dprint(tag: 'Socket', 'Failed to start connection: $e');
    }
  }

  Future<void> stopConnection() async {
    await _hubConnection.stop();
    dprint(tag: 'Socket', 'Disconnected');
  }
}
