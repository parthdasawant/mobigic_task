import 'package:flutter/material.dart';
import 'package:mobigic_task/presentation/word_matching_screen/bloc/word_matching_screen_bloc.dart';

class CustomSearchBox extends StatelessWidget {
  CustomSearchBox({
    super.key,
    required this.grid,
    required this.m,
    required this.n,
    required this.bloc
  });
  final List<List<String>> grid;
  final int m;
  final int n;
  final WordMatchingScreenBloc bloc;

  final searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          // suffixIcon: const Icon(Icons.search),
          hintText: 'Enter text here for matching',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        ),
        onSubmitted: (value) {
          // print(TextSearcher.searchTextInMatrix(grid, value.trim().toUpperCase()));
          bloc.add(SearchTextEvent(grid: grid, text: value.trim().toUpperCase()));
        },
        // onChanged: (value){
        //   print(value);
        // },
        onTap: (){
          bloc.add(SearchTextEvent(grid: grid, text: ""));
          searchController.text = "";
        },
      ),
    );
  }
}
