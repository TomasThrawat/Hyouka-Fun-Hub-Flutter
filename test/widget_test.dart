import 'package:flutter_test/flutter_test.dart';
import 'package:hyouka_fun_hub/main.dart';

void main() {
  testWidgets('hub loads, searches, and filters games', (tester) async {
    await tester.pumpWidget(const HyoukaFunHub());

    expect(games, hasLength(35));
    expect(find.text('Hyouka Fun Hub'), findsOneWidget);
    expect(find.text('20 Questions'), findsOneWidget);

    final search = find.byType(TextField);
    await tester.enterText(search, 'Fake Hacker Terminal');
    await tester.pump();
    expect(find.text('Fake Hacker Terminal'), findsOneWidget);

    await tester.enterText(search, '');
    await tester.pump();

    await tester.tap(find.text('Arcade'));
    await tester.pump();
    expect(find.text('Snake'), findsOneWidget);
    expect(find.text('2048'), findsOneWidget);
  });
}
