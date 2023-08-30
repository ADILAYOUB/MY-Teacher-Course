import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/app_event.dart';
import 'package:myteacher/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitState()) {
    on<IncrementCounter>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
    on<DecrementCounter>((event, emit) {
      emit(AppState(counter: state.counter - 1));
    });
  }
}
