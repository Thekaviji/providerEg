import 'package:flutter/foundation.dart';

class IncrementProvider extends ChangeNotifier {
  List<int> number = [1, 2, 3, 4, 5];

  void increment() {
    number.add(number.last + 1);
    notifyListeners();
  }
}
