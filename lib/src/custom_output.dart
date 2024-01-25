import 'dart:io';

import 'package:logger/logger.dart';

abstract class GeneralLoggerOutput extends LogOutput {
  @override
  void output(OutputEvent event);
}

class ProLogger extends GeneralLoggerOutput {
  Map<Level, File> files = {};
  late List<String> excludePaths;

  ProLogger(Map<Level, String> paths, List<String> excludePaths) {
    this.excludePaths = excludePaths;
    for (var entry in paths.entries) {
      files[entry.key] = File(entry.value);
    }
  }

  @override
  void output(OutputEvent event) {
    var file = files[event.level];
    if (file != null) {
      for (var line in event.lines) {
        bool isEqual = true;
        excludePaths.forEach((element) {
          if (line.contains(element)) {
            isEqual = false;
          }
        });
        if (isEqual) {
          file.writeAsStringSync('$line\n', mode: FileMode.append);
        }
      }
    }
  }
}
