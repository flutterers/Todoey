class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleCheck() {
    print("$isDone before ");
    isDone = !isDone;
    print("$isDone after ");
  }
}
