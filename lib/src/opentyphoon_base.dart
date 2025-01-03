import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:opentyphoon/src/models/generate_content_response.dart';

/// A class representing the OpenTyphoon service interface.
///
/// This class serves as the main entry point for interacting with the OpenTyphoon API.
class OpenTyphoon {}

/// A class for generating content using OpenTyphoon's generative AI models.
///
/// This class handles the communication with OpenTyphoon's API for text generation
/// and content creation tasks. It provides methods to generate content based on
/// given prompts and parameters.
///
/// Example usage:
/// ```dart
/// final model = GenerativeModel(
///   model: 'model-name',
///   apiKey: 'your-api-key'
/// );
/// final response = await model.generateContent([
///   {'role': 'user', 'content': 'Hello!'}
/// ]);
/// ```
class GenerativeModel {
  /// The identifier of the AI model to use for generation.
  String model;

  /// The API key used for authentication with the OpenTyphoon API.
  String apiKey;

  /// The base URI for the OpenTyphoon API endpoints.
  static const uri = 'https://api.opentyphoon.ai/v1/chat/completions';

  /// Creates a new instance of [GenerativeModel].
  ///
  /// Parameters:
  /// - [model]: The identifier of the AI model to use.
  /// - [apiKey]: The API key for authentication.
  GenerativeModel({
    required this.model,
    required this.apiKey,
  });

  /// Generates content based on the provided input messages.
  ///
  /// Takes a list of message objects containing role and content pairs.
  /// Each message should be a Map with 'role' and 'content' keys.
  ///
  /// Parameters:
  /// - [contents]: List of message maps, each containing 'role' and 'content' keys.
  ///
  /// Returns a [Future] that completes with a [GenerateContentResponse].
  ///
  /// Throws an error if the API request fails or returns a non-200 status code.
  ///
  /// Example:
  /// ```dart
  /// final response = await model.generateContent([
  ///   {'role': 'user', 'content': 'Write a story about a cat.'}
  /// ]);
  /// ```
  Future<GenerateContentResponse> generateContent(
      List<Map<String, String>> contents) async {
    final url = Uri.parse('https://api.opentyphoon.ai/v1/chat/completions');
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'User-Agent': 'insomnia/10.2.0',
    };
    final body = jsonEncode({
      "model": model,
      "max_tokens": 512,
      "messages": contents,
      "temperature": 0.4,
      "top_p": 0.9,
      "top_k": 0,
      "repetition_penalty": 1.05,
      "min_p": 0.05,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        return generateContentResponseFromJson(response.body);
      } else {
        throw ('Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }
}
