import 'package:bot_toast/bot_toast.dart';
import 'package:expedientes/config/colors/colors.dart';
import 'package:flutter/material.dart';

class HelperNotificationUI {
  static final HelperNotificationUI _instancia =
      HelperNotificationUI._internal();

  factory HelperNotificationUI() {
    return _instancia;
  }
  HelperNotificationUI._internal();

  static void notificationSuccess(String msg) {
    BotToast.showNotification(
      duration: const Duration(seconds: 5),
      backgroundColor: MainColorsApp.backgroundColorTextFields,
      borderRadius: 12.0,
      margin: const EdgeInsets.all(15),
      leading: (cancel) => const SizedBox(
          height: 40,
          width: 40,
          child: Icon(
            Icons.check,
            color: Colors.white,
          )),
      title: (_) => Text(
        '$msg${(msg.endsWith('.') ? '' : '.')}',
        style: const TextStyle(
            color: MainColorsApp.brightColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      trailing: (cancel) => IconButton(
        icon: const Icon(Icons.cancel, color: Colors.white),
        onPressed: cancel,
      ),
    );
  }

  static void notificationError(String msg) {
    BotToast.showNotification(
      duration: const Duration(seconds: 5),
      backgroundColor: MainColorsApp.backgroundColorTextFields,
      borderRadius: 12.0,
      margin: const EdgeInsets.all(15),
      leading: (cancel) => const SizedBox(
          height: 40,
          width: 40,
          child: Icon(
            Icons.close,
            color: Colors.red,
          )),
      title: (_) => Text(
        '$msg${(msg.endsWith('.') ? '' : '.')}',
        style: const TextStyle(
            color: MainColorsApp.brightColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      trailing: (cancel) => IconButton(
        icon: const Icon(Icons.cancel, color: Colors.white),
        onPressed: cancel,
      ),
    );
  }
}
