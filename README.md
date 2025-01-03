# OpenTyphoon Dart Package

A Dart package for integrating OpenTyphoon AI's large language models (LLM) into your applications.

## Features

- Simple API for generating content using OpenTyphoon AI models
- Type-safe interface for making API requests
- Support for the latest OpenTyphoon AI models
- Easy integration with existing Dart applications

## Getting Started

Add `opentyphoon` to your `pubspec.yaml`:

```yaml
dependencies:
  opentyphoon: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

First, import the package:

```dart
import 'package:opentyphoon/opentyphoon.dart';
```

Create a `GenerativeModel` instance with your API key and desired model, then use it to generate content:

```dart
Future<void> main() async {
  final apiKey = 'YOUR-API-KEY';
  final prompt = 'Burger recipe';

  final model = GenerativeModel(
    model: 'typhoon-v1.5-instruct',
    apiKey: apiKey,
  );

  try {
    final response = await model.generateContent([Content.text(prompt)]);
    print(response.choices.first.message.content);
  } catch (e) {
    print('Error generating content: $e');
  }
}
```

## Available Models

Currently supported models:
- `typhoon-v1.5-instruct`: Latest instruction-tuned model

## Error Handling

The package includes proper error handling for common scenarios:
- Invalid API key
- Network connectivity issues
- Model-specific errors

## License

[Add your license information here]

## Contributing

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting pull requests.