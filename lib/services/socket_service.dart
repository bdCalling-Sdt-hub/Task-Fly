import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../helpers/prefs_helper.dart';
import '../utils/app_url.dart';
import 'notification_service.dart';

class SocketServices {
  static late io.Socket socket;
  bool show = false;

  ///<<<============ Connect with socket ====================>>>
  static void connectToSocket() {
    socket = io.io(
        AppUrls.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setReconnectionAttempts(5)
            .setReconnectionDelay(2000)
            .build());

    socket.onConnect((_) {
      debugPrint("=============================> Connected to Socket");
    });

    socket.onConnectError((data) {
      debugPrint("============================> Connection Error: $data");
    });

    socket.onDisconnect((_) {
      debugPrint("============================> Disconnected from Socket");
    });

    socket.onReconnect((attempt) {
      debugPrint(
          "===================> Reconnected to Socket (Attempt: $attempt)");
    });

    socket.onReconnectAttempt((attempt) {
      debugPrint(
          "============================> Trying to Reconnect (Attempt: $attempt)");
    });

    socket.onReconnectError((error) {
      debugPrint("============================> Reconnection Failed: $error");
    });

    socket.onReconnectFailed((_) {
      debugPrint(
          "============================> Reconnection Failed: Max attempts reached");
    });

    socket.on("user-notification::${PrefsHelper.userId}", (data) {
      debugPrint("================> Received Data on Socket: $data");
      NotificationService.showNotification(data);
    });

    socket.connect();
  }
}
