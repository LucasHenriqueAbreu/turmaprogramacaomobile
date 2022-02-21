import 'package:flutter/widgets.dart';

class HomeController {
  ValueNotifier count = ValueNotifier<int>(0);

  void increment() {
    count.value++;
  }
  
}