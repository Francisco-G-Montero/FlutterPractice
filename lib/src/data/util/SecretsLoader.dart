import 'package:flutter/services.dart';
import 'dart:convert' show json;

import 'Secrets.dart';

class SecretsLoader {
  final String secretGoogleMapPath;

  SecretsLoader({required this.secretGoogleMapPath});

  Future<Secrets> loadGoogleApiKey() {
    return rootBundle.loadStructuredData<Secrets>(this.secretGoogleMapPath,
        (jsonStr) async {
      final secret = Secrets.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}
