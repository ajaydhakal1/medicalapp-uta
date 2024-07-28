import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreateMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Handle when a notification is displayed. If it's clicked
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceiveMethod(
      ReceivedNotification receivedNotification) async {
    // Handle when a notification is displayed. If it's clicked
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    // Handle when a notification is displayed. If it's clicked
  }
}
