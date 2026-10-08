import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hyouka_fun_hub/main.dart';

void main() {
  testWidgets('hub loads, searches, and filters games', (tester) async {
    await tester.pumpWidget(const HyoukaFunHub());

    expect(games, hasLength(39));
    expect(find.text('مركز هيوكا للألعاب'), findsOneWidget);
    expect(find.text('أسئلة العشرين'), findsOneWidget);

    final search = find.byType(TextField);
    await tester.enterText(search, 'المحطة الوهمية');
    await tester.pump();

    final gameCard = find.descendant(
      of: find.byType(Card),
      matching: find.text('المحطة الوهمية'),
    );
    expect(gameCard, findsOneWidget);

    await tester.enterText(search, '');
    await tester.pump();

    await tester.tap(find.text('أركيد'));
    await tester.pump();
    expect(find.text('الثعبان'), findsOneWidget);
    expect(find.text('2048'), findsOneWidget);

    await tester.enterText(search, 'الحساب السريع');
    await tester.pump();
    expect(find.text('الحساب السريع'), findsOneWidget);

    await tester.enterText(search, 'نمط الأرقام');
    await tester.pump();
    expect(find.text('نمط الأرقام'), findsOneWidget);
  });

  test('question generators produce unique content across a long sample', () {
    final generators = <Q Function(int)>[
      generateTriviaQuestion,
      generateWhoQuestion,
      generateRiddleQuestion,
      generateAnimeQuestion,
      generateImpossibleQuestion,
      generateMathQuestion,
      generateSequenceQuestion,
      generateTrueFalseQuestion,
      generateCompareQuestion,
    ];

    for (final generator in generators) {
      final keys = <String>{};
      for (var seed = 0; seed < 500; seed++) {
        expect(keys.add(generator(seed).key), isTrue);
      }
    }
  });
}
