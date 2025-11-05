import 'package:flutter_test/flutter_test.dart';
import 'package:projet_flutter/main.dart';

void main() {
  testWidgets('Eventify app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EventifyApp());
    expect(find.text('Eventify'), findsOneWidget);
  });
}
