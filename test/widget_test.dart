// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:barakat/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// لێرەدا دەبێت ناوی پڕۆژەکەت بنووسیت لە جیاتی 'your_project_name'
// بۆ نموونە ئەگەر ناوی پڕۆژەکەت barakat بێت، دەبێت ئاوا بێت:
// import 'package:barakat/screen/welcome-page.dart';
import 'package:barakat/screens/welcome_page.dart';

void main() {
  testWidgets('Welcome page load test', (WidgetTester tester) async {
    // لێرەدا ئەپەکە دەست پێ دەکەین بە بەکارهێنانی WelcomePage
    await tester.pumpWidget(const MaterialApp(home: WelcomePage()));

    // پشکنین بۆ ئەوەی بزانین دەقی "بەخێرهاتی" لەسەر شاشەیە یان نا
    expect(find.text('بەخێرهاتی'), findsOneWidget);
  });
}
