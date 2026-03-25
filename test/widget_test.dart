import 'package:barakat/screens/login_page.dart';
import 'package:barakat/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Welcome page navigates to login page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomePage()));

    expect(find.byIcon(Icons.eco), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(AppLoginPage), findsOneWidget);
  });
}
