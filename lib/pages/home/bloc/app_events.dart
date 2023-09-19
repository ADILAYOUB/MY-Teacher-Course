abstract class AppEvent {
  const AppEvent();
}

class TiggerEventApp extends AppEvent {
// This class will get the value from the UI as we add the event
  final int index;
  const TiggerEventApp(this.index) : super();
}
