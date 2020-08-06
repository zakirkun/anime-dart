abstract class SearchException implements Exception {}

class InvalidTextException extends SearchException {
  final String message;

  InvalidTextException(this.message);

  String toString() {
    return "Invalid Text Search Exception: $message";
  }
}

class NotFoundResultsException extends SearchException {
  final String message;

  NotFoundResultsException(this.message);

  String toString() {
    return "Not Found Search Exception: $message";
  }
}

class InvalidLetterException extends SearchException {
  final String message;

  InvalidLetterException(this.message);

  String toString() {
    return "Invalid Letter Search Exception: $message";
  }
}

class RequestException extends SearchException {
  final String message;

  RequestException(this.message);

  String toString() {
    return "Invalid Letter Search Exception: $message";
  }
}

class NoConnectionException extends SearchException {
  final String message;

  NoConnectionException(this.message);

  String toString() {
    return "Invalid Letter Search Exception: $message";
  }
}
