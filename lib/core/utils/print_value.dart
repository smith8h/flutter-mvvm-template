import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

void dprint(dynamic value, {String tag = ''}) {
  try {
    var decodedJSON = json.decode(value.toString());
    if (decodedJSON is Map<String, dynamic> || decodedJSON is List<dynamic>) {
      log('$tag: ${JsonEncoder.withIndent('  ').convert(decodedJSON)}\n');
    } else {
      _logValue(value, tag);
    }
  } catch (_) {
    _logValue(value, tag);
  }
}

void _logValue(dynamic value, String tag) {
  if (value is Map || value is List) {
    log('$tag: ${JsonEncoder.withIndent('  ').convert(value)}\n');
  } else {
    if (kDebugMode) {
      log('$tag: $value\n');
    }
  }
}
