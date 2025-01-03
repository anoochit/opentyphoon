import 'dart:convert';

import 'package:example_flutter/const.dart';
import 'package:opentyphoon/opentyphoon.dart';

class GenAIProvider {
  final String _apiKey = apiKey;

  Future<String> generateText(String prompt) async {
    final model = GenerativeModel(
      model: "typhoon-v1.5-instruct",
      apiKey: _apiKey,
    );

    final response = await model.generateContent([Content.text(prompt)]);
    return utf8.decode('${response.choices!.first.message!.content}'.codeUnits);
  }
}
