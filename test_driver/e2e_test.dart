/*
This chunk of code implements all the test cases
using following command

flutter driver --target=test_driver/e2e.dart
 */

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter_text');
    final buttonFinder = find.byTooltip('increment');
    final buttonAdd = find.byValueKey('add');
    final buttonSubtract = find.byValueKey('subtract');
    final alertText = find.byValueKey('alert_text');
    final buttonClose = find.byValueKey('close_button');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Increment the counter', () async {
      //Tap the floating action button
      await driver.tap(buttonFinder);
      //Verify that counter text has been increased by 1
      expect(await driver.getText(counterTextFinder), "1");
      //
      //tap on the button once more
      await driver.tap(buttonFinder);
      //Verify that counter text has been increased by 1 more
      expect(await driver.getText(counterTextFinder), "2");
      //
    });
  });
}
