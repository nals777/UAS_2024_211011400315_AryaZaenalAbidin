import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:crypto_prices/main.dart';

void main() {
  testWidgets('Crypto List Page loads and displays data',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Check if the CircularProgressIndicator is displayed while data is loading.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the FutureBuilder to complete and display the data.
    await tester.pumpAndSettle();

    // Check if the ListView is displayed after data is loaded.
    expect(find.byType(ListView), findsOneWidget);

    // Check if at least one ListTile is displayed (assuming API returns data).
    expect(find.byType(ListTile), findsWidgets);
  });
}
