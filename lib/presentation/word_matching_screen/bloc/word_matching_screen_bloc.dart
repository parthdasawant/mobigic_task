import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'word_matching_screen_event.dart';
part 'word_matching_screen_state.dart';

class WordMatchingScreenBloc extends Bloc<WordMatchingScreenEvent, WordMatchingScreenState> {
  WordMatchingScreenBloc() : super(WordMatchingScreenInitial()) {
    on<WordMatchingScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
