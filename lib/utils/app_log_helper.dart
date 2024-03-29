import 'package:logger/logger.dart';

///Created by colan on 16/12/19

//get logger
Logger getLogger(String className) {
  return Logger(printer: AppLogHelper(className));
}

//log util to print log
class AppLogHelper extends LogPrinter {
  final String className;

  AppLogHelper(this.className);

  @override
  void log(Level level, message, error, StackTrace stackTrace) {
    var color = PrettyPrinter.levelColors[level];
    var emoji = PrettyPrinter.levelEmojis[level];

    if (true) {
      //have to check is in debug mode or production mode to disable the log or not
      println(color('$emoji $className - $message'));
    }
  }
}
