import 'package:test/test.dart';
import '../lib/utils/sanity.dart';

void main() {
  test('sanity unit test', () {
    const answer = 42;
    expect(answer, 42);
  });

  test('we can import the echo', () {
    final response = echo('kill me');
    expect(response, 'Echoing: kill me');
  });
}