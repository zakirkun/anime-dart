abstract class FavoritesException implements Exception {}

class RequestFavoriteFailed extends FavoritesException {
  final String message;

  RequestFavoriteFailed(this.message);

  String toString() {
    return "An error ocurred on try favorite action: $message";
  }
}
