import 'package:http/http.dart';
import 'dart:async';
import 'package:test/test.dart';
import 'dart:convert';
import 'package:http/testing.dart';

final String numbersJSON = JSON.encode({
  'numbers': [1, 1, 2, 3]
});

final Response response404 = new Response('', 404, headers: { 'content-type': 'application/json' });

Future<Response> mockServerFn(Request request) {
  if (request.url.path == '/numbers.json') {
    final Response response = new Response(numbersJSON, 200, headers:  { 'content-type': 'application/json' });
    return new Future.value(response); 
  }
  return new Future.value(response404);
}

final Client client = new MockClient(mockServerFn);

void main() {
  test('we can make async io requests', () async {
    final Response response = await client.get('/numbers.json');
    expect(response.statusCode, 200);
    expect(response.headers, equals({ 'content-type': 'application/json' }));
    expect(JSON.decode(response.body), equals({ 'numbers': [1, 1, 2, 3] }));
  });
}