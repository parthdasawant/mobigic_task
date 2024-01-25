part of 'word_matching_screen_bloc.dart';

@immutable
abstract class WordMatchingScreenState {}

class WordMatchingScreenInitial extends WordMatchingScreenState {}

class WordMatchingSuccessState extends WordMatchingScreenState{
  final List<int> matchedIndex;

  WordMatchingSuccessState({required this.matchedIndex});
}
