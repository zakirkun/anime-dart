import 'dart:math';

class Utils {
  static int randomInt(int min, int max) {
    final random = Random();

    return random.nextInt(max) + min;
  }
}
