/// A utility class for creating message content structures.
class Content {
  /// Creates a map representing a user message with the given text content.
  ///
  /// Parameters:
  ///   s - The text content of the message
  ///
  /// Returns a Map with two key-value pairs:
  ///   - "content": The provided text message
  ///   - "role": Always set to "user"
  static Map<String, String> text(String s) {
    return {"content": s, "role": "user"};
  }
}
