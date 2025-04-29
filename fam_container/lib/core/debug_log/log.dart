import 'package:flutter/foundation.dart';

enum LogType {
  debug(0),
  info(1),
  warning(2),
  error(3);

  final int id;
  const LogType(this.id);
}

class Logger {
  static final _levelPrefixes = {
    LogType.debug: '🐛',
    LogType.info: '👻',
    LogType.warning: '⚠️',
    LogType.error: '‼️',
  };

  static void log(
    String? message, {
    StackTrace? stackTrace,
    LogType level = LogType.debug,
  }) {
    if (kDebugMode) {
      final stackMessage =
          stackTrace != null ? '\n StackTrace -> $stackTrace' : '';
      print(
        '${_levelPrefixes[level]} -> $message $stackMessage ',
      );
    }
  }
}

void log(String m) => Logger.log(m);

void logInfo(String m) => Logger.log(m, level: LogType.info);

void logWarning(String m, {StackTrace? s}) =>
    Logger.log(m, stackTrace: s, level: LogType.warning);

void logError(String m, [StackTrace? s]) =>
    Logger.log(m, stackTrace: s, level: LogType.error);
