import 'dart:async';

import 'package:get/get.dart';

class CounterController extends GetxController {
  /// counter that is incrememnted every 1 second in range between
  ///  [baseValue] (0 by default) and [maxValue]
  CounterController({
    required int maxValue,
    int baseValue = 0,
    Duration duration = const Duration(seconds: 1),
  })  : _baseValue = baseValue,
        _count = baseValue.obs,
        _maxValue = maxValue,
        _duration = duration;

  final int _baseValue;
  final int _maxValue;
  final RxInt _count;
  final Duration _duration;

  int get count => _count.value;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(_duration, (_) => increment());
  }

  void increment() {
    int count = _count.value;
    _count.value = count != _maxValue
        ? (++count).clamp(_baseValue, _maxValue)
        : _baseValue;
  }
}
