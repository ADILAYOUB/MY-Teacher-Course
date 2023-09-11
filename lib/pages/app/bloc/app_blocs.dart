import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';
import 'app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  // AppBlocs(super.initialState);
  AppBlocs() : super(const AppState()) {
    on<TiggerEventApp>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
