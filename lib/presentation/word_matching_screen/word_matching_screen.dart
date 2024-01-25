import 'package:flutter/material.dart';
import 'package:mobigic_task/presentation/word_matching_screen/bloc/word_matching_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_search_box.dart';
import '../../widgets/grid.dart';

class WordMatchingScreen extends StatefulWidget {
  const WordMatchingScreen(
      {super.key, required this.grid, required this.m, required this.n});

  final List<List<String>> grid;
  final int m;
  final int n;

  @override
  State<WordMatchingScreen> createState() => _WordMatchingScreenState();
}

class _WordMatchingScreenState extends State<WordMatchingScreen> {
  late WordMatchingScreenBloc bloc;

  @override
  void initState() {
    bloc = WordMatchingScreenBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation:0.0,
        title: const Text("MOBIGIC"),
      ),
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.white,
      body: Column(
        children: [
          CustomSearchBox(
            grid: widget.grid,
            m: widget.m,
            n: widget.n,
            bloc: bloc,
          ),
          Expanded(
            child: BlocBuilder<WordMatchingScreenBloc, WordMatchingScreenState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is WordMatchingSuccessState) {
                  return Grid(
                      grid: widget.grid,
                      m: widget.m,
                      n: widget.n,
                      matchedIndex: state.matchedIndex);
                } else {
                  return Grid(
                      grid: widget.grid,
                      m: widget.m,
                      n: widget.n,
                      matchedIndex: const []);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
