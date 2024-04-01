import 'dart:convert';
import 'dart:developer';
import 'package:logger/logger.dart';

final L = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true, // Should each log print contain a timestamp
    ),
    //level: Platform.environment.containsKey('FLUTTER_TEST') ? Level.error : Level.debug);
    level: Level.debug);

String stringify(jsonObject) {
  const encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}

longDebug(String content) => log(content);
