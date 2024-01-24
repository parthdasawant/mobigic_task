import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'grid_filling_screen_event.dart';
part 'grid_filling_screen_state.dart';

class GridFillingScreenBloc extends Bloc<GridFillingScreenEvent, GridFillingScreenState> {
  GridFillingScreenBloc() : super(GridFillingScreenInitial()) {
    on<GridFillingScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
