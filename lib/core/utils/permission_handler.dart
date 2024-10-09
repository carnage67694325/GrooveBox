import 'package:permission_handler/permission_handler.dart';

abstract class PermissionHandler {
  static Future<void> requestPermissions() async {
    // Request storage permissions (for Android 13 and below)
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }

    // Request media permissions for Android 13+
    if (await Permission.audio.isDenied) {
      await [
        Permission.audio,
      ].request();
    }

    // Request audio recording permission
    if (await Permission.microphone.isDenied) {
      await Permission.microphone.request();
    }

    // Request notifications permission (Android 13 and above)
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  Future<bool> hasAllPermissions() async {
    return await Permission.storage.isGranted &&
        await Permission.audio.isGranted &&
        await Permission.videos.isGranted &&
        await Permission.microphone.isGranted &&
        await Permission.notification.isGranted;
  }
}
