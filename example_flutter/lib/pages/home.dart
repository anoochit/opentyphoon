import 'package:example_flutter/pages/bloc/generate_text_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _data = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocBuilder<GenerateTextBloc, GenerateTextState>(
        bloc: GenerateTextBloc(),
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    context
                        .read<GenerateTextBloc>()
                        .add(GenerateTextSubmited('สูตรข้าวมันไก่'));
                  },
                  child: Text('Ask สูตรข้าวมันไก่'),
                ),
                BlocListener<GenerateTextBloc, GenerateTextState>(
                  listener: (context, state) {
                    if (state is GenerateTextResultState) {
                      setState(() {
                        _loading = false;
                        _data = state.text;
                      });
                    }

                    if (state is GenerateTextLoading) {
                      setState(() {
                        _loading = true;
                      });
                    }
                  },
                  child: (_loading) ? CircularProgressIndicator() : Text(_data),
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
