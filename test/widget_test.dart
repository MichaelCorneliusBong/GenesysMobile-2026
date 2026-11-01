import 'package:flutter_test/flutter_test.dart';
import 'package:genesysmobile_2026/main.dart';

void main() {
  testWidgets('GenesysMetaApp loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GenesysMetaApp());

    expect(find.text('Browse Decks'), findsOneWidget);
    expect(find.text('Search Cards'), findsOneWidget);
  });
}
