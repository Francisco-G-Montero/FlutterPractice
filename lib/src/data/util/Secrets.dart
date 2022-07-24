class Secrets {
  final String apiKey;

  Secrets({this.apiKey = ""});

  factory Secrets.fromJson(Map<String, dynamic> jsonMap) {
    return Secrets(apiKey: jsonMap["google_maps_api_key"]);
  }
}