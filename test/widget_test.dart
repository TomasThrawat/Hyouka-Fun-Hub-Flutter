import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hyouka_fun_hub/main.dart';
import 'package:hyouka_fun_hub/question_engine.dart';
import 'package:hyouka_fun_hub/question_games.dart';

void main() {
  testWidgets('hub loads, searches, filters, and exposes quick actions', (tester) async {
    await tester.pumpWidget(const HyoukaFunHub());

    expect(games, hasLength(39));
    expect(find.text('مركز هيوكا للألعاب'), findsOneWidget);
    expect(find.text('أسئلة العشرين'), findsOneWidget);
    expect(find.byTooltip('لعبة عشوائية'), findsOneWidget);
    expect(find.byTooltip('التحدي اليومي'), findsOneWidget);

    final search = find.byType(TextField);
    await tester.enterText(search, 'المحطة الوهمية');
    await tester.pump();
    expect(find.text('المحطة الوهمية'), findsWidgets);

    await tester.enterText(search, '');
    await tester.pump();
    await tester.tap(find.text('أركيد'));
    await tester.pump();
    expect(find.text('الثعبان'), findsOneWidget);
    expect(find.text('2048'), findsOneWidget);

    await tester.enterText(search, 'الحساب السريع');
    await tester.pump();
    expect(find.text('الحساب السريع'), findsOneWidget);

    await tester.tap(find.byTooltip('التحدي اليومي'));
    await tester.pumpAndSettle();
    expect(find.text('التحدي اليومي'), findsOneWidget);
    expect(find.text('السؤال التالي'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
  });

  test('question generators provide varied content and mixed sessions avoid exact repeats', () {
    final generators = <Q Function(int)>[
      generateTwentyQuestion,
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
      for (var seed = 0; seed < 50; seed++) {
        keys.add(generator(seed).key);
      }
      expect(keys.length, greaterThan(10));
    }

    final used = <String>{};
    var serial = 0;
    for (var i = 0; i < 500; i++) {
      var accepted = false;
      for (var attempt = 0; attempt < 5000; attempt++) {
        final generator = generators[pickIndex(
          serial + attempt,
          909,
          generators.length,
        )];
        final q = generator(serial * 17 + attempt);
        serial++;
        if (used.add(q.key)) {
          accepted = true;
          break;
        }
      }
      expect(accepted, isTrue);
    }
    expect(used.length, 500);
  });

  test('true or false generator randomizes answer position correctly', () {
    var seenFirst = false;
    var seenSecond = false;
    for (var seed = 0; seed < 1000; seed++) {
      final q = generateTrueFalseQuestion(seed);
      expect(q.options, containsAll(<String>['صح', 'غلط']));
      expect(q.options[q.answer], anyOf('صح', 'غلط'));
      if (q.answer == 0) seenFirst = true;
      if (q.answer == 1) seenSecond = true;
    }
    expect(seenFirst, isTrue);
    expect(seenSecond, isTrue);
  });

  test('twenty questions expose computed yes/no answers', () {
    for (var seed = 0; seed < 1000; seed++) {
      final q = generateTwentyQuestion(seed);
      expect(q.options, containsAll(<String>['نعم', 'لا']));
      expect(q.options[q.answer], anyOf('نعم', 'لا'));
    }
  });

  testWidgets('question game exposes title, scoring, difficulty, pause/resume, and answer flow', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: EndlessQuestionGame(
            gameId: 'test',
            title: 'اختبار',
            generator: generateMathQuestion,
          ),
        ),
      ),
    );

    expect(find.textContaining('اختبار'), findsOneWidget);
    expect(find.textContaining('النقاط'), findsOneWidget);
    expect(find.textContaining('سهل'), findsOneWidget);
    expect(find.byTooltip('إيقاف مؤقت'), findsOneWidget);

    await tester.tap(find.byTooltip('إيقاف مؤقت'));
    await tester.pump();
    expect(find.text('استئناف اللعبة'), findsOneWidget);

    await tester.tap(find.text('استئناف اللعبة'));
    await tester.pump();
    expect(find.byTooltip('إيقاف مؤقت'), findsOneWidget);

    await tester.tap(find.byType(FilledButton).first);
    await tester.pump();
    expect(find.text('السؤال التالي'), findsOneWidget);
  });
}
