import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/pages/home/bloc/home_page_events.dart';

import 'home_page_state.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_handleHomePageDots);
  }
  void _handleHomePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }
}
