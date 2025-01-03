// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_flutter/provider/genai_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// event
sealed class GenerateTextEvent {}

class GenerateTextSubmited extends GenerateTextEvent {
  final String prompt;
  GenerateTextSubmited(this.prompt);
}

// state
class GenerateTextState {}

class GenerateTextLoading extends GenerateTextState {}

class GenerateTextResultState extends GenerateTextState {
  String text;
  GenerateTextResultState({
    required this.text,
  });
}

// bloc
class GenerateTextBloc extends Bloc<GenerateTextEvent, GenerateTextState> {
  GenerateTextBloc() : super(GenerateTextState()) {
    on<GenerateTextSubmited>((event, emit) async {
      emit(GenerateTextLoading());
      final result = await GenAIProvider().generateText(event.prompt);
      emit(GenerateTextResultState(text: result));
    });
  }
}
