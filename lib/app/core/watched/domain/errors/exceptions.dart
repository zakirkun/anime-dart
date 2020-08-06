abstract class WatchedException implements Exception {}

class FailedRequestWatchedException extends WatchedException {
  final String message;

  FailedRequestWatchedException(this.message);

  String toString() {
    return "An error ocurred on get watched stats: $message";
  }
}

class InvalidEpisodeIdException extends WatchedException {
  final String message;

  InvalidEpisodeIdException(this.message);

  String toString() {
    return "Invalid episode ID exception: $message";
  }
}
