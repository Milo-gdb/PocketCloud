import '../Services/service.dart';

class CounterController {
  final CounterService _service = CounterService();
  int counter = 0;

  void init() {
    counter = _service.fetchInitialCounter();
  }

  void increment() {
    counter++;
  }
}
