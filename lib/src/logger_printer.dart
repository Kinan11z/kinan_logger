import 'package:logger/logger.dart';

// Print message only
class MessagePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}

// Print message and level
class LevelMessagePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ['${event.level}: ${event.message}'];
  }
}

// Print message and time
class TimeMessagePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ['${DateTime.now()}: ${event.message}'];
  }
}

// Print message and error
class ErrorMessagePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [
      event.error != null ? '${event.error}: ${event.message}' : event.message
    ];
  }
}

// Print message and stackTrace
class StackTraceMessagePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [
      event.stackTrace != null
          ? '${event.stackTrace}: ${event.message}'
          : event.message
    ];
  }
}
