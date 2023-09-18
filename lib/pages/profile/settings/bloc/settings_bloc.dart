import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/pages/profile/settings/bloc/settings_events.dart';
import 'package:myteacher/pages/profile/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBloc() : super(const SettingsStates()) {
    on<LoadSettings>(_tiggerSettings);
  }

  _tiggerSettings(SettingsEvents events, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}
