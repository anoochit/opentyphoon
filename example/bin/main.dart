import 'package:opentyphoon/opentyphoon.dart';

Future<void> main(List<String> args) async {
  String apiKey = 'YOUR-API-KEY';
  String prompt = 'Burger recipe';

  final model = GenerativeModel(
    model: 'typhoon-v1.5-instruct',
    apiKey: apiKey,
  );

  try {
    final response = await model.generateContent([Content.text(prompt)]);
    print(response.choices!.first.message!.content);
  } catch (e) {
    print('$e');
  }
}
