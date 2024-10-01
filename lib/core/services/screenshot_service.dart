import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ScreenshotService {
  final ScreenshotController _screenshotController = ScreenshotController();

  Future<void> takeScreenshotAndShare() async {
    try {
      final Uint8List? screenshot = await _screenshotController.capture();
      if (screenshot != null) {
        final imagePath = await _saveScreenshot(screenshot);
        await _shareScreenshot(imagePath);
      }
    } catch (e) {
      throw Exception('Failed to Take ScreenShot and Share');
    }
  }

  Future<File> _saveScreenshot(Uint8List screenshot) async {
    final directory = await getTemporaryDirectory();
    final imagePath = File('${directory.path}/weather_app_screenshot.png');
    return imagePath.writeAsBytes(screenshot);
  }

  Future<void> _shareScreenshot(File imagePath) async {
    final XFile file = XFile(imagePath.path);
    await Share.shareXFiles([file], text: 'Check out the weather!');
  }

  ScreenshotController get screenshotController => _screenshotController;
}
