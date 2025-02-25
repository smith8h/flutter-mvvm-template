import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

void dprint(dynamic value, {String tag = ''}) {
  try {
    var decodedJSON = json.decode(value.toString()) as Map<String, dynamic>;
    log('$tag: ${JsonEncoder.withIndent('    ').convert(decodedJSON)}\n');
  } catch (_) {
    if (value is Map) {
      log('$tag: ${JsonEncoder.withIndent('    ').convert(value)}\n');
    } else {
      if (kDebugMode) {
        log('$tag: $value\n\n');
      }
    }
  }
}
