part of 'word_matching_screen_bloc.dart';

@immutable
abstract class WordMatchingScreenEvent {}

class SearchTextEvent extends WordMatchingScreenEvent{
  final List<List<String>> grid;
  final String text;

  SearchTextEvent({required this.grid, required this.text});
}
