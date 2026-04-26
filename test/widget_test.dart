import 'package:flutter_test/flutter_test.dart';

import 'package:thesis_manament_system/main.dart';

void main() {
  testWidgets('renders landing page entry screen', (tester) async {
    await tester.pumpWidget(const ThesisManagementApp());
    await tester.pump();

    expect(find.text('ThesisMS'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
