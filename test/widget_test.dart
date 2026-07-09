// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app_bar_practice/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts and displays curved app bar examples list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title of the app bar exists.
    expect(find.text('Curved App Bar Examples'), findsOneWidget);

    // Verify that some destinations in the list are rendered.
    expect(find.text('Travel Explorer'), findsOneWidget);
    expect(find.text('Gourmet Bites Delivery'), findsOneWidget);
    expect(find.text('Workspace Tasks'), findsOneWidget);
    expect(find.text('User Profile Settings'), findsOneWidget);
  });
}
