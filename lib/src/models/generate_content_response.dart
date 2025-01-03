// To parse this JSON data, do
//
//     final generateContentResponse = generateContentResponseFromJson(jsonString);

import 'dart:convert';

/// Converts a JSON string to a [GenerateContentResponse] object.
GenerateContentResponse generateContentResponseFromJson(String str) =>
    GenerateContentResponse.fromJson(json.decode(str));

/// Converts a [GenerateContentResponse] object to a JSON string.
String generateContentResponseToJson(GenerateContentResponse data) =>
    json.encode(data.toJson());

/// A class representing the response from a content generation API.
///
/// To parse this JSON data, use:
/// ```dart
/// final generateContentResponse = generateContentResponseFromJson(jsonString);
/// ```
class GenerateContentResponse {
  /// Unique identifier for the response
  String? id;

  /// List of generated choices/completions
  List<Choice>? choices;

  /// Unix timestamp of when the response was created
  int? created;

  /// The model used for generation
  String? model;

  /// Type of the object
  String? object;

  /// System fingerprint for the response
  dynamic systemFingerprint;

  /// Usage statistics for the request
  Usage? usage;

  /// Service tier used for the request
  dynamic serviceTier;

  /// The original prompt that generated this response
  List<dynamic>? prompt;

  /// Duration of the request in seconds
  double? duration;

  GenerateContentResponse({
    this.id,
    this.choices,
    this.created,
    this.model,
    this.object,
    this.systemFingerprint,
    this.usage,
    this.serviceTier,
    this.prompt,
    this.duration,
  });

  /// Creates a [GenerateContentResponse] instance from a JSON map.
  factory GenerateContentResponse.fromJson(Map<String, dynamic> json) =>
      GenerateContentResponse(
        id: json["id"],
        choices: json["choices"] == null
            ? []
            : List<Choice>.from(
                json["choices"]!.map((x) => Choice.fromJson(x))),
        created: json["created"],
        model: json["model"],
        object: json["object"],
        systemFingerprint: json["system_fingerprint"],
        usage: json["usage"] == null ? null : Usage.fromJson(json["usage"]),
        serviceTier: json["service_tier"],
        prompt: json["prompt"] == null
            ? []
            : List<dynamic>.from(json["prompt"]!.map((x) => x)),
        duration: json["duration"]?.toDouble(),
      );

  /// Converts this [GenerateContentResponse] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "id": id,
        "choices": choices == null
            ? []
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
        "created": created,
        "model": model,
        "object": object,
        "system_fingerprint": systemFingerprint,
        "usage": usage?.toJson(),
        "service_tier": serviceTier,
        "prompt":
            prompt == null ? [] : List<dynamic>.from(prompt!.map((x) => x)),
        "duration": duration,
      };
}

/// Represents a single generated choice/completion in the response.
class Choice {
  /// Reason why the generation finished
  String? finishReason;

  /// Index of this choice in the list of choices
  int? index;

  /// The generated message
  Message? message;

  Choice({
    this.finishReason,
    this.index,
    this.message,
  });

  /// Creates a [Choice] instance from a JSON map.
  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        finishReason: json["finish_reason"],
        index: json["index"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  /// Converts this [Choice] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "finish_reason": finishReason,
        "index": index,
        "message": message?.toJson(),
      };
}

/// Represents a message in the response.
class Message {
  /// The content of the message
  String? content;

  /// The role of the message sender (e.g., "user", "assistant")
  String? role;

  /// Any tool calls made during generation
  dynamic toolCalls;

  /// Any function calls made during generation
  dynamic functionCall;

  Message({
    this.content,
    this.role,
    this.toolCalls,
    this.functionCall,
  });

  /// Creates a [Message] instance from a JSON map.
  factory Message.fromJson(Map<String, dynamic> json) => Message(
        content: json["content"],
        role: json["role"],
        toolCalls: json["tool_calls"],
        functionCall: json["function_call"],
      );

  /// Converts this [Message] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "content": content,
        "role": role,
        "tool_calls": toolCalls,
        "function_call": functionCall,
      };
}

/// Represents usage statistics for the API request.
class Usage {
  /// Number of tokens in the prompt
  int? promptTokens;

  /// Number of tokens in the completion
  int? completionTokens;

  /// Total number of tokens used
  int? totalTokens;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  /// Creates a [Usage] instance from a JSON map.
  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  /// Converts this [Usage] instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
