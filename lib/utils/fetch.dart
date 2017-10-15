import 'package:http/http.dart' as http;
import 'dart:async';

final http.Client client = new http.Client();

Future fetch(String uri) async {
  return await client.get(uri);
}