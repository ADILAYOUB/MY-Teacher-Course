// we have to take the increment and decrement button

class AppState {
  int counter;
  AppState({required this.counter});
}

class InitState extends AppState {
  InitState() : super(counter: 0);
}
