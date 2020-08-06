class DetailsException implements Exception {}

class DetailsNotFoundException extends DetailsException {
  final String message;

  DetailsNotFoundException(this.message);

  String toString() {
    return "Not found details exception: $message";
  }
}

class FailedRequestException extends DetailsException {
  final String message;

  FailedRequestException(this.message);

  String toString() {
    return "A request fail exception: $message";
  }
}


class InvalidIdException  extends DetailsException {
  final String message;

  FailedRequestException(this.message);

  String toString() {
    return "A request fail exception: $message";
  }
}

