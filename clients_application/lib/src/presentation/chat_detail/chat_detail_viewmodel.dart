import 'dart:developer';

import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/utils/app_pref.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatDetailViewModel extends BaseViewModel {
  late Socket socket;
  initial() async {
    socketServer();
  }

  socketServer() {
    try {
      socket = io("http://localhost:3000", <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });

      socket.connect();
      socket.on("connect", (_) => log("Socket connect: ${socket.id}"));
      socket.emit("_getUsers", {'senderEmail': AppPref.email});
    } catch (e) {
      log("ERROR SOCKET: ${e.toString()}");
    }
  }
}
