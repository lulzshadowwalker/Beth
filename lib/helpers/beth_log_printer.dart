import 'package:logger/logger.dart';

class BethLogPrinter extends LogPrinter {
  final String className;
  BethLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];

    return [color!('$emoji + $className | ${event.message}')];
  }
}
