import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class Utils {
  static int randomInt(int min, int max) {
    final random = Random();

    return random.nextInt(max) + min;
  }

  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
