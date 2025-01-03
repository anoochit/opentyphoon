// To parse this JSON data, do
//
//     final generateContentResponse = generateContentResponseFromJson(jsonString);

import 'dart:convert';

GenerateContentResponse generateContentResponseFromJson(String str) =>
    GenerateContentResponse.fromJson(json.decode(str));

String generateContentResponseToJson(GenerateContentResponse data) =>
    json.encode(data.toJson());

class GenerateContentResponse {
  String? id;
  List<Choice>? choices;
  int? created;
  String? model;
  String? object;
  dynamic systemFingerprint;
  Usage? usage;
  dynamic serviceTier;
  List<dynamic>? prompt;
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

class Choice {
  String? finishReason;
  int? index;
  Message? message;

  Choice({
    this.finishReason,
    this.index,
    this.message,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        finishReason: json["finish_reason"],
        index: json["index"],
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "finish_reason": finishReason,
        "index": index,
        "message": message?.toJson(),
      };
}

class Message {
  String? content;
  String? role;
  dynamic toolCalls;
  dynamic functionCall;

  Message({
    this.content,
    this.role,
    this.toolCalls,
    this.functionCall,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        content: json["content"],
        role: json["role"],
        toolCalls: json["tool_calls"],
        functionCall: json["function_call"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "role": role,
        "tool_calls": toolCalls,
        "function_call": functionCall,
      };
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
