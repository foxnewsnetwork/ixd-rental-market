import 'dart:async';

// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('setup sanity test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('measure sanity', () async {
      const txtVal = 'You have pushed the button this many times:';

      Timeline timeline = await driver.traceAction(() async {
        SerializableFinder sanityText = find.text(txtVal);
        final textContent = await driver.getText(sanityText, timeout: new Duration(milliseconds: 666));
        expect(textContent, txtVal);
      });

      TimelineSummary summary = new TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('setup_sanity_perf', pretty: true);
      summary.writeTimelineToFile('setup_sanity_perf', pretty: true);
    });
  });
}