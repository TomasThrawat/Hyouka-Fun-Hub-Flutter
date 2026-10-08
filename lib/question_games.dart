import 'dart:math';
import 'package:flutter/material.dart';
import 'question_engine.dart';

class GameStatsStore {
  GameStatsStore._();
  static final instance = GameStatsStore._();

  int totalAnswered = 0;
  int totalCorrect = 0;
  int bestStreak = 0;
  int bestScore = 0;
  final Map<String, int> gamePlays = <String, int>{};
  final Set<String> dailyPlayedDays = <String>{};

  void startGame(String gameId) {
    gamePlays[gameId] = (gamePlays[gameId] ?? 0) + 1;
  }

  void recordAnswer({
    required String gameId,
    required bool correct,
    required int score,
    required int streak,
  }) {
    totalAnswered++;
    if (correct) totalCorrect++;
    bestStreak = max(bestStreak, streak);
    bestScore = max(bestScore, score);
  }

  void markDailyPlayed(String dayKey) {
    dailyPlayedDays.add(dayKey);
  }

  int get dailyStreak {
    var streak = 0;
    var cursor = DateTime.now();
    while (dailyPlayedDays.contains(_dayKey(cursor))) {
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }
}

String _dayKey(DateTime date) =>
    date.year.toString().padLeft(4, '0') +
    date.month.toString().padLeft(2, '0') +
    date.day.toString().padLeft(2, '0');

QuestionDifficulty difficultyForQuestion(int questionNumber) {
  if (questionNumber <= 3) return QuestionDifficulty.easy;
  if (questionNumber <= 7) return QuestionDifficulty.medium;
  if (questionNumber <= 14) return QuestionDifficulty.hard;
  return QuestionDifficulty.expert;
}

final questionGenerators = <Q Function(int)>[
  generateTriviaQuestion,
  generateWhoQuestion,
  generateRiddleQuestion,
  generateAnimeQuestion,
  generateImpossibleQuestion,
  generateMathQuestion,
  generateSequenceQuestion,
  generateTrueFalseQuestion,
  generateCompareQuestion,
  generateTwentyQuestion,
];

class EndlessQuestionGame extends StatefulWidget {
  final String gameId;
  final String title;
  final Q Function(int seed) generator;
  final int seedOffset;
  final bool dailyMode;

  const EndlessQuestionGame({
    super.key,
    required this.title,
    required this.generator,
    this.gameId = 'question-game',
    this.seedOffset = 0,
    this.dailyMode = false,
  });

  @override
  State<EndlessQuestionGame> createState() => _EndlessQuestionGameState();
}

class _EndlessQuestionGameState extends State<EndlessQuestionGame> {
  final used = <String>{};
  var serial = 0;
  late Q current;
  int score = 0;
  int questionNumber = 1;
  int streak = 0;
  int bestSessionStreak = 0;
  int correctCount = 0;
  bool paused = false;
  int? picked;

  Q _nextUnique() {
    for (var attempt = 0; attempt < 5000; attempt++) {
      final seed = widget.seedOffset + serial++;
      final q = widget.generator(seed);
      if (used.add(q.key)) {
        return q.withDifficulty(difficultyForQuestion(questionNumber));
      }
    }
    throw StateError('تعذر توليد سؤال جديد فريد');
  }

  @override
  void initState() {
    super.initState();
    GameStatsStore.instance.startGame(widget.gameId);
    current = _nextUnique();
  }

  void answer(int option) {
    if (paused || picked != null) return;
    final correct = option == current.answer;
    final earned = questionBasePoints(current.difficulty) + min(15, (streak + 1) * 2).toInt();
    setState(() {
      picked = option;
      if (correct) {
        streak++;
        correctCount++;
        bestSessionStreak = max(bestSessionStreak, streak);
        score += earned;
      } else {
        streak = 0;
      }
      GameStatsStore.instance.recordAnswer(
        gameId: widget.gameId,
        correct: correct,
        score: score,
        streak: streak,
      );
      if (widget.dailyMode) {
        GameStatsStore.instance.markDailyPlayed(_dayKey(DateTime.now()));
      }
    });
  }

  void next() {
    if (picked == null || paused) return;
    setState(() {
      questionNumber++;
      current = _nextUnique();
      picked = null;
    });
  }

  void restart() {
    used.clear();
    serial = 0;
    score = 0;
    questionNumber = 1;
    streak = 0;
    bestSessionStreak = 0;
    correctCount = 0;
    picked = null;
    paused = false;
    setState(() => current = _nextUnique());
    GameStatsStore.instance.startGame(widget.gameId);
  }

  @override
  Widget build(BuildContext context) {
    final stats = GameStatsStore.instance;
    final earned = questionBasePoints(current.difficulty) + min(15, (streak + 1) * 2).toInt();
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title +
                      ' • السؤال ' +
                      arNumber(questionNumber) +
                      ' • ' +
                      questionDifficultyLabel(current.difficulty),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
              IconButton(
                tooltip: paused ? 'استئناف' : 'إيقاف مؤقت',
                onPressed: () => setState(() => paused = !paused),
                icon: Icon(paused ? Icons.play_arrow : Icons.pause),
              ),
            ],
          ),
          Text(
            'النقاط ' +
                arNumber(score) +
                ' • السلسلة ' +
                arNumber(streak) +
                ' • الأفضل ' +
                arNumber(bestSessionStreak),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12),
          if (paused)
            Expanded(
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => setState(() => paused = false),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('استئناف اللعبة'),
                ),
              ),
            )
          else ...[
            Card(
              color: const Color(0xFF111111),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  current.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const SizedBox(height: 14),
            ...List.generate(
              current.options.length,
              (i) => Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: FilledButton.tonal(
                  onPressed: picked == null ? () => answer(i) : null,
                  child: Text(current.options[i], textAlign: TextAlign.center),
                ),
              ),
            ),
            const Spacer(),
            if (picked != null)
              Text(
                picked == current.answer
                    ? 'إجابة صحيحة • +' +
                        arNumber(earned) +
                        ' نقطة'
                    : 'إجابة غير صحيحة',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: picked == null ? null : next,
              child: const Text('السؤال التالي'),
            ),
            TextButton(onPressed: restart, child: const Text('إعادة الجولة')),
            Text(
              'هذه الجلسة: ' +
                  arNumber(correctCount) +
                  ' صحيحة • أفضل نتيجة عامة: ' +
                  arNumber(stats.bestScore),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ],
      ),
    );
  }
}

class TriviaGame extends StatelessWidget {
  const TriviaGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'trivia', title: 'المسابقة المتنوعة', generator: generateTriviaQuestion);
}
class WhoGame extends StatelessWidget {
  const WhoGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'who', title: 'من أنا؟', generator: generateWhoQuestion);
}
class RiddleGame extends StatelessWidget {
  const RiddleGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'riddle', title: 'الألغاز', generator: generateRiddleQuestion);
}
class AnimeGame extends StatelessWidget {
  const AnimeGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'anime', title: 'مسابقة الأنمي', generator: generateAnimeQuestion);
}
class ImpossibleGame extends StatelessWidget {
  const ImpossibleGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'impossible', title: 'المسابقة الخادعة', generator: generateImpossibleQuestion);
}
class MathQuizGame extends StatelessWidget {
  const MathQuizGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'math', title: 'الحساب السريع', generator: generateMathQuestion);
}
class SequenceGame extends StatelessWidget {
  const SequenceGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'sequence', title: 'نمط الأرقام', generator: generateSequenceQuestion);
}
class TrueFalseGame extends StatelessWidget {
  const TrueFalseGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'truefalse', title: 'صح أم غلط', generator: generateTrueFalseQuestion);
}
class CompareGame extends StatelessWidget {
  const CompareGame({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'compare', title: 'الأكبر؟', generator: generateCompareQuestion);
}
class TwentyQ extends StatelessWidget {
  const TwentyQ({super.key});
  @override Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: '20q', title: 'أسئلة العشرين', generator: generateTwentyQuestion);
}

class ClueGame extends StatelessWidget {
  const ClueGame({super.key});

  @override
  Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'character',
    title: 'خمن الشخصية',
    generator: generateClueQuestion,
  );
}

class RatherGame extends StatelessWidget {
  const RatherGame({super.key});

  @override
  Widget build(BuildContext context) => const EndlessQuestionGame(
    gameId: 'rather',
    title: 'ماذا تفضل؟',
    generator: generateRatherQuestion,
  );
}

class DailyChallengePage extends StatelessWidget {
  const DailyChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final daySeed = today.year * 10000 + today.month * 100 + today.day;
    final generator = questionGenerators[
      pickIndex(daySeed, 707, questionGenerators.length)
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('التحدي اليومي', style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: SafeArea(
        child: EndlessQuestionGame(
          gameId: 'daily',
          title: 'التحدي اليومي',
          generator: (seed) => generator(daySeed + seed),
          seedOffset: 1000,
          dailyMode: true,
        ),
      ),
    );
  }
}
