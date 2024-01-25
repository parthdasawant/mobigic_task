import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/text_searcher.dart';

part 'word_matching_screen_event.dart';
part 'word_matching_screen_state.dart';

class WordMatchingScreenBloc extends Bloc<WordMatchingScreenEvent, WordMatchingScreenState> {
  WordMatchingScreenBloc() : super(WordMatchingScreenInitial()) {
    on<SearchTextEvent>(searchTextEvent);
  }

  FutureOr<void> searchTextEvent(SearchTextEvent event, Emitter<WordMatchingScreenState> emit) {
        List<int> matchedIndex = [];
        matchedIndex.addAll(TextSearcher.searchTextInMatrix(event.grid, event.text));
        emit(WordMatchingSuccessState(matchedIndex: matchedIndex));
  }
}
