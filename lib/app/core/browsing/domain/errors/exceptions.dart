abstract class BrowsingException implements Exception {}

class UnableToFetchDataException extends BrowsingException {
  final String message;

  UnableToFetchDataException(this.message);

  String toString() {
    return "Unable to fetch data: $message";
  }
}
