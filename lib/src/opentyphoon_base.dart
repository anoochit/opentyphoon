import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:opentyphoon/src/models/generate_content_response.dart';

class OpenTyphoon {}

class GenerativeModel {
  String model;
  String apiKey;

  static const uri = 'https://api.opentyphoon.ai/v1/chat/completions';

  GenerativeModel({
    required this.model,
    required this.apiKey,
  });

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
