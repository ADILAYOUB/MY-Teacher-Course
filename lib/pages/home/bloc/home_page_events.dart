abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  // pass value from the UI which is index
  final int index;
  // constructor
  const HomePageDots(this.index);
}
