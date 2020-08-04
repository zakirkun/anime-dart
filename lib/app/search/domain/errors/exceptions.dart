abstract class SearchException implements Exception {}

class InvalidTextException extends SearchException {
  final message = "The search text must be not null or empty";

  String toString() {
    return "Invalid Text Search Exception: $message";
  }
}

class NotFoundResultsException extends SearchException {
  final message = "This search dont match any results, try others keywords";

  String toString() {
    return "Not Found Search Exception: $message";
  }
}
