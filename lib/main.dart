import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const HyoukaFunHub());

class Game {
  final String id, title, subtitle, category;
  final IconData icon;
  const Game(this.id, this.title, this.subtitle, this.category, this.icon);
}

const games = <Game>[
  Game('20q','أسئلة العشرين','أسئلة نعم أو لا بلا توقف','الأسئلة',Icons.help_outline),
  Game('character','خمن الشخصية','أدلة مختلفة في كل دورة','الأسئلة',Icons.person_search),
  Game('rather','ماذا تفضل؟','اختيارات متغيرة دون نهاية','الأسئلة',Icons.compare_arrows),
  Game('trivia','المسابقة المتنوعة','أسئلة عربية متجددة','الأسئلة',Icons.quiz),
  Game('who','من أنا؟','شخصيات وأوصاف مختلفة','الأسئلة',Icons.badge),
  Game('riddle','الألغاز','ألغاز متنوعة في كل دورة','الأسئلة',Icons.lightbulb_outline),
  Game('word','سلسلة الكلمات','كلمات جديدة باستمرار','الأسئلة',Icons.link),
  Game('impostor','المتسلل','جولات متتابعة بأسرار مختلفة','الأسئلة',Icons.visibility_off),
  Game('text','المغامرة النصية','قصة ومسارات متجددة','الأسئلة',Icons.map),
  Game('detective','المحقق','قضايا وأدلة مختلفة','الأسئلة',Icons.search),
  Game('battle','معركة الأسئلة','سرعة ونقاط وسلسلة مستمرة','الأسئلة',Icons.local_fire_department),
  Game('memory','اختبار الذاكرة','تسلسلات مختلفة باستمرار','الأسئلة',Icons.psychology),
  Game('snake','الثعبان','نقاط مستمرة بلا نهاية','أركيد',Icons.grid_4x4),
  Game('2048','2048','دمج مستمر بلا نهاية','أركيد',Icons.grid_view),
  Game('tetris','المربعات الساقطة','قطع وصفوف متجددة','أركيد',Icons.view_module),
  Game('mines','كاسحة الألغام','خلايا وجولات متتابعة','أركيد',Icons.warning_amber),
  Game('pong','كرة ومضرب','حافظ على اللعب لأطول وقت','أركيد',Icons.sports_tennis),
  Game('flappy','قفزة الطائر','حواجز جديدة باستمرار','أركيد',Icons.flight),
  Game('reaction','سرعة الاستجابة','اختبارات متغيرة باستمرار','أركيد',Icons.flash_on),
  Game('typing','سرعة الكتابة','جمل عربية مختلفة','أركيد',Icons.keyboard),
  Game('clicker','عداد النقر','جولات نقر متواصلة','أركيد',Icons.touch_app),
  Game('number','خمن الرقم','رقم جديد بعد كل إصابة','أركيد',Icons.numbers),
  Game('rps','حجر ورق مقص','مباريات متتالية','أركيد',Icons.back_hand),
  Game('sudoku','سودوكو صغير','ألواح مختلفة باستمرار','أركيد',Icons.apps),
  Game('checkers','الداما','حركات متواصلة','أركيد',Icons.circle),
  Game('runner','العداء اللا نهائي','تقدم مستمر وتغيير مسار','أركيد',Icons.directions_run),
  Game('maze','المتاهة','متاهة جديدة بعد كل عبور','أركيد',Icons.route),
  Game('dungeon','زنزانة هيوكا','مغامرة مختلفة باستمرار','غريب',Icons.auto_awesome),
  Game('mystery','مولد الغموض','ألغاز مختلفة بلا توقف','غريب',Icons.shuffle),
  Game('challenge','التحدي العشوائي','مهام جديدة بلا تكرار فوري','غريب',Icons.casino),
  Game('anime','مسابقة الأنمي','أسئلة أنمي متجددة','غريب',Icons.movie_filter),
  Game('impossible','المسابقة الخادعة','ألغاز خادعة متغيرة','غريب',Icons.report_problem),
  Game('math','الحساب السريع','مسائل جديدة بلا توقف','الأسئلة',Icons.calculate),
  Game('sequence','نمط الأرقام','تسلسلات جديدة بلا تكرار','الأسئلة',Icons.timeline),
  Game('truefalse','صح أم غلط','عبارات جديدة في كل سؤال','الأسئلة',Icons.fact_check),
  Game('compare','الأكبر؟','مقارنات رقمية بلا نهاية','الأسئلة',Icons.compare),
  Game('terminal','المحطة الوهمية','محاكاة عربية آمنة','غريب',Icons.terminal),
  Game('escape','غرفة الهروب','رموز مختلفة باستمرار','غريب',Icons.lock_open),
  Game('boss','زعيم الأسئلة','زعيم جديد بعد كل هزيمة','غريب',Icons.shield),
];

class HyoukaFunHub extends StatelessWidget {
  const HyoukaFunHub({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'مركز هيوكا للألعاب',
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: Colors.black,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white), bodyMedium: TextStyle(color: Colors.white), bodySmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white), titleMedium: TextStyle(color: Colors.white), titleSmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white), labelMedium: TextStyle(color: Colors.white), labelSmall: TextStyle(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Colors.white, secondary: Colors.white, surface: Color(0xFF111111),
        onSurface: Colors.white, onPrimary: Colors.black, onSecondary: Colors.black,
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black, foregroundColor: Colors.white, elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true, fillColor: Color(0xFF111111), hintStyle: TextStyle(color: Colors.white), labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF444444))),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
      filledButtonTheme: FilledButtonThemeData(style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFF242424)),
      )),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll<Color>(Colors.white))),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll<Color>(Colors.white))),
      chipTheme: const ChipThemeData(
        backgroundColor: Color(0xFF111111), selectedColor: Color(0xFF2A2A2A),
        labelStyle: TextStyle(color: Colors.white), secondaryLabelStyle: TextStyle(color: Colors.white),
      ),
    ),
    home: const HomePage(),
    builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child ?? const SizedBox.shrink()),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String filter = 'الكل', search = '';
  @override
  Widget build(BuildContext context) {
    final items = games.where((g) {
      final okCat = filter == 'الكل' || g.category == filter;
      final q = search.toLowerCase().trim();
      return okCat && (q.isEmpty || g.title.toLowerCase().contains(q) || g.subtitle.toLowerCase().contains(q));
    }).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('مركز هيوكا للألعاب', style: TextStyle(fontWeight: FontWeight.w900))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,8,16,12),
          child: TextField(onChanged: (v)=>setState(()=>search=v), decoration: const InputDecoration(
            filled: true, fillColor: Color(0xFF111111), prefixIcon: Icon(Icons.search), hintText: 'ابحث عن لعبة...'
          )),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left:16,right:16,bottom:12),
          child: Row(children: ['الكل','الأسئلة','أركيد','غريب'].map((c)=>Padding(
            padding: const EdgeInsets.only(right:8),
            child: ChoiceChip(label: Text(c), selected: filter==c, onSelected: (_)=>setState(()=>filter=c)),
          )).toList()),
        ),
        Expanded(child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(16,0,16,24),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:240,crossAxisSpacing:12,mainAxisSpacing:12,childAspectRatio:1.15),
          itemCount: items.length,
          itemBuilder: (_,i) {
            final g=items[i];
            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_)=>GamePage(game:g))),
              child: Card(color: const Color(0xFF111111), child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  Icon(g.icon,size:30), const Spacer(),
                  Text(g.title,maxLines:2,overflow:TextOverflow.ellipsis,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w900)),
                  const SizedBox(height:5),
                  Text(g.subtitle,maxLines:2,overflow:TextOverflow.ellipsis,style:const TextStyle(color:Colors.white,fontSize:12)),
                ]),
              )),
            );
          },
        )),
      ]),
    );
  }
}

class GamePage extends StatelessWidget {
  final Game game;
  const GamePage({super.key,required this.game});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(game.title,style:const TextStyle(fontWeight:FontWeight.w900))),
    body: SafeArea(child: GameRouter(id:game.id,title:game.title)),
  );
}

class GameRouter extends StatelessWidget {
  final String id,title;
  const GameRouter({super.key,required this.id,required this.title});
  @override Widget build(BuildContext context) {
    switch(id) {
      case '20q': return const TwentyQ();
      case 'character': return const ClueGame();
      case 'rather': return const RatherGame();
      case 'trivia': return const TriviaGame();
      case 'who': return const WhoGame();
      case 'riddle': return const RiddleGame();
      case 'word': return const WordGame();
      case 'impostor': return const ImpostorGame();
      case 'text': return const StoryGame();
      case 'dungeon': return const DungeonGame();
      case 'detective': return const DetectiveGame();
      case 'battle': return const BattleGame();
      case 'memory': return const MemoryGame();
      case 'snake': return const SnakeGame();
      case '2048': return const Game2048();
      case 'tetris': return const TetrisGame();
      case 'mines': return const MinesGame();
      case 'pong': return const PongGame();
      case 'flappy': return const FlappyGame();
      case 'reaction': return const ReactionGame();
      case 'typing': return const TypingGame();
      case 'clicker': return const ClickerGame();
      case 'number': return const NumberGame();
      case 'rps': return const RpsGame();
      case 'sudoku': return const SudokuGame();
      case 'checkers': return const CheckersGame();
      case 'runner': return const RunnerGame();
      case 'maze': return const MazeGame();
      case 'challenge': return const ChallengeGame();
      case 'mystery': return const MysteryGame();
      case 'anime': return const AnimeGame();
      case 'impossible': return const ImpossibleGame();
      case 'math': return const MathQuizGame();
      case 'sequence': return const SequenceGame();
      case 'truefalse': return const TrueFalseGame();
      case 'compare': return const CompareGame();
      case 'terminal': return const FakeTerminalGame();
      case 'escape': return const EscapeGame();
      case 'boss': return const BossGame();
      default: return Center(child: Text(title));
    }
  }
}


class Q {
  final String text;
  final List<String> options;
  final int answer;
  const Q(this.text, this.options, this.answer);
  String get key => text + '|' + (options.toSet().toList()..sort()).join('|');
}

class CharacterInfo {
  final String name, universe, role, trait;
  const CharacterInfo(this.name, this.universe, this.role, this.trait);
}

const characterPool = <CharacterInfo>[
  CharacterInfo('ماريو','Super Mario','يخوض مغامرات لإنقاذ الأميرة','يرتبط بالقبعة الحمراء'),
  CharacterInfo('لويجي','Super Mario','يساعد شقيقه في المغامرات','يرتبط بالقبعة الخضراء'),
  CharacterInfo('لينك','The Legend of Zelda','بطل هيرول','يستخدم السيف والقوس'),
  CharacterInfo('سونك','Sonic the Hedgehog','قنفذ سريع ينقذ أصدقاءه','يرتبط باللون الأزرق'),
  CharacterInfo('كيربي','Kirby','يستخدم قدرته على ابتلاع الأعداء','يرتبط باللون الوردي'),
  CharacterInfo('بيكاتشو','Pokémon','يستخدم هجمات كهربائية','يرتبط باللون الأصفر'),
  CharacterInfo('ناروتو','Naruto','يسعى ليصبح هوكاجي','يستخدم تقنيات النينجا'),
  CharacterInfo('غوكو','Dragon Ball','محارب سايان يحب القتال','يستخدم الكي والتحولات'),
  CharacterInfo('لوفي','One Piece','يقود طاقم قبعة القش','يبحث عن كنز ون بيس'),
  CharacterInfo('زورو','One Piece','مبارز في طاقم قبعة القش','يستخدم ثلاثة سيوف'),
  CharacterInfo('تانجيرو','Demon Slayer','يصطاد الشياطين ويحمي أخته','يستخدم تنفس الماء'),
  CharacterInfo('نيزوكو','Demon Slayer','تحاول مقاومة رغبة الدماء','هي أخت تانجيرو'),
  CharacterInfo('إيرين','Attack on Titan','يقاتل العمالقة ويحمي أصدقاءه','يرتبط بقوة العمالقة'),
  CharacterInfo('ليفاي','Attack on Titan','جندي نخبة يقاتل العمالقة','يشتهر بالمهارة في القتال'),
  CharacterInfo('غوجو','Jujutsu Kaisen','مدرس ساحر قوي','يرتبط بتقنية اللانهاية'),
  CharacterInfo('إيتشيغو','Bleach','بديل لحاصد أرواح','يحمل سيف زانباكتو'),
  CharacterInfo('لايت','Death Note','طالب يستخدم دفتر الموت','يحاول تغيير العالم بطريقته'),
  CharacterInfo('إدوارد','Fullmetal Alchemist','كيميائي دولة في رحلة بحث','يستخدم الكيمياء'),
  CharacterInfo('غون','Hunter x Hunter','صياد شاب يبحث عن والده','يحب المغامرة والاستكشاف'),
  CharacterInfo('ديكو','My Hero Academia','بطل متدرب في أكاديمية الأبطال','يرتبط بقوة One For All'),
  CharacterInfo('سايتاما','One Punch Man','بطل يهزم أعداءه بلكمة واحدة','أصلع ويرتدي بدلة صفراء'),
  CharacterInfo('أش','Pokémon','مدرب بوكيمون ومسافر','يسافر مع بيكاتشو'),
  CharacterInfo('تشوبر','One Piece','طبيب طاقم قبعة القش','هو حيوان رنّة يستطيع تغيير شكله'),
  CharacterInfo('روبين','One Piece','باحثة في التاريخ وعضو في الطاقم','تستخدم قدرة هانا هانا نو مي'),
  CharacterInfo('نامي','One Piece','ملاحة طاقم قبعة القش','تتقن قراءة الخرائط'),
  CharacterInfo('أوراراكا','My Hero Academia','بطلة متدربة في أكاديمية الأبطال','تملك قدرة التحكم في الجاذبية'),
  CharacterInfo('كاكاشي','Naruto','نينجا ومدرب فريق','يشتهر بالشارينغان'),
  CharacterInfo('غارا','Naruto','كاجي قرية الرمال','يستخدم الرمل في القتال'),
  CharacterInfo('إيتادوري','Jujutsu Kaisen','طالب ساحر في مدرسة الجوجوتسو','يرتبط بسكونا'),
  CharacterInfo('سوكونا','Jujutsu Kaisen','لعنة قوية جدًا','يُعرف بملك اللعنات'),
];

const _facts = <List<String>>[
  ['ما أكبر محيط على الأرض؟','المحيط الهادئ','المحيط الأطلسي','المحيط الهندي','المحيط المتجمد الشمالي'],
  ['ما الغاز الأكثر وفرة في الغلاف الجوي؟','النيتروجين','الأكسجين','الهيدروجين','ثاني أكسيد الكربون'],
  ['كم كوكبًا في النظام الشمسي؟','ثمانية','سبعة','تسعة','عشرة'],
  ['ما اسم الكوكب الأحمر؟','المريخ','الزهرة','عطارد','نبتون'],
  ['ما أكبر كوكب في النظام الشمسي؟','المشتري','زحل','الأرض','نبتون'],
  ['ما رمز الماء الكيميائي؟','H2O','CO2','O2','NaCl'],
  ['ما الكوكب الأقرب إلى الشمس؟','عطارد','الأرض','المريخ','الزهرة'],
  ['كم ضلعًا للمثلث؟','ثلاثة','أربعة','خمسة','ستة'],
  ['كم دقيقة في الساعة؟','ستون','خمسون','أربعون','سبعون'],
  ['كم ثانية في الدقيقة؟','ستون','ثلاثون','مائة','مائتان'],
  ['ما عاصمة مصر؟','القاهرة','الإسكندرية','الأقصر','أسوان'],
  ['ما اللغة التي تستخدمها Flutter أساسًا؟','Dart','Java','Swift','Kotlin'],
];

int _mix(int value) {
  var x = value & 0x7fffffff;
  x ^= x >> 16;
  x = (x * 0x45d9f3b) & 0x7fffffff;
  x ^= x >> 16;
  x = (x * 0x45d9f3b) & 0x7fffffff;
  x ^= x >> 16;
  return x & 0x7fffffff;
}

int _pick(int seed, int salt, int length) {
  if (length <= 1) return 0;
  return _mix(seed + salt * 1009) % length;
}

String _arNumber(int value) {
  const digits = '٠١٢٣٤٥٦٧٨٩';
  return value.toString().split('').map((x) {
    final i = int.tryParse(x);
    return i == null ? x : digits[i];
  }).join();
}

List<String> _shuffleOptions(String correct, Iterable<String> distractors, int seed) {
  final values = <String>[correct];
  for (final value in distractors) {
    if (value != correct && !values.contains(value)) values.add(value);
    if (values.length == 4) break;
  }
  for (var i = values.length - 1, salt = 17; i > 0; i--, salt++) {
    final j = _pick(seed, salt, i + 1);
    final temp = values[i];
    values[i] = values[j];
    values[j] = temp;
  }
  return values;
}

Q _mcq(String text, String correct, List<String> distractors, int seed) {
  final options = _shuffleOptions(correct, distractors, seed);
  return Q(text, options, options.indexOf(correct));
}

Q _numericQuestion(String text, int answer, int seed) {
  final gap = 1 + _pick(seed, 7, 9);
  final candidates = <int>{answer};
  for (var step = 1; candidates.length < 4; step++) {
    final delta = gap * step;
    candidates.add(answer + delta);
    candidates.add(answer - delta);
  }
  final answerText = _arNumber(answer);
  final options = _shuffleOptions(answerText, candidates.map(_arNumber), seed);
  return Q(text, options, options.indexOf(answerText));
}

Q generateTriviaQuestion(int seed) {
  if (_pick(seed, 1, 3) == 0) {
    final fact = _facts[_pick(seed, 2, _facts.length)];
    final variant = _pick(seed, 3, 3);
    final text = variant == 0
        ? fact[0]
        : variant == 1
            ? 'اختر الإجابة الصحيحة: ' + fact[0]
            : 'معلومة سريعة: ' + fact[0];
    return _mcq(text, fact[1], fact.sublist(2), seed);
  }
  switch (_pick(seed, 11, 12)) {
    case 0:
      final a = 10 + _pick(seed, 12, 90);
      final b = 1 + _pick(seed, 13, 90);
      return _numericQuestion('ما ناتج ' + _arNumber(a) + ' + ' + _arNumber(b) + '؟', a + b, seed);
    case 1:
      final a = 5 + _pick(seed, 14, 30);
      final b = 2 + _pick(seed, 15, 20);
      return _numericQuestion('ما ناتج ' + _arNumber(a) + ' × ' + _arNumber(b) + '؟', a * b, seed);
    case 2:
      final a = 20 + _pick(seed, 16, 80);
      final b = 1 + _pick(seed, 17, 30);
      final high = max(a, b);
      final low = min(a, b);
      return _numericQuestion('ما ناتج ' + _arNumber(high) + ' − ' + _arNumber(low) + '؟', high - low, seed);
    case 3:
      final divisor = 2 + _pick(seed, 18, 8);
      final quotient = 2 + _pick(seed, 19, 20);
      final answer = divisor * quotient;
      return _numericQuestion('ما ناتج ' + _arNumber(answer) + ' ÷ ' + _arNumber(divisor) + '؟', quotient, seed);
    case 4:
      final minutes = 2 + _pick(seed, 20, 58);
      return _numericQuestion('كم ثانية في ' + _arNumber(minutes) + ' دقيقة؟', minutes * 60, seed);
    case 5:
      final hours = 1 + _pick(seed, 21, 23);
      return _numericQuestion('كم دقيقة في ' + _arNumber(hours) + ' ساعة؟', hours * 60, seed);
    case 6:
      final days = 1 + _pick(seed, 22, 20);
      return _numericQuestion('كم ساعة في ' + _arNumber(days) + ' يومًا؟', days * 24, seed);
    case 7:
      final a = 1 + _pick(seed, 23, 50);
      var b = 1 + _pick(seed, 24, 50);
      if (a == b) b++;
      final high = max(a, b);
      return _mcq('أي العددين أكبر: ' + _arNumber(a) + ' أم ' + _arNumber(b) + '؟', _arNumber(high), [_arNumber(min(a, b)),'متساويان',_arNumber(high + 1)], seed);
    case 8:
      final n = 2 + _pick(seed, 25, 999);
      final answer = n.isEven ? 'زوجي' : 'فردي';
      return _mcq('العدد ' + _arNumber(n) + ' هو...', answer, [answer == 'زوجي' ? 'فردي' : 'زوجي','عدد أولي','عدد سالب'], seed);
    case 9:
      final power = 2 + _pick(seed, 26, 7);
      final answer = pow(2, power).toInt();
      return _numericQuestion('ما قيمة ٢ أس ' + _arNumber(power) + '؟', answer, seed);
    case 10:
      final a = 10 + _pick(seed, 27, 70);
      final b = 2 + _pick(seed, 28, 20);
      final c = 1 + _pick(seed, 29, 10);
      return _numericQuestion('ما ناتج ' + _arNumber(a) + ' + ' + _arNumber(b) + ' − ' + _arNumber(c) + '؟', a + b - c, seed);
    default:
      final a = 10 + _pick(seed, 30, 90);
      return _numericQuestion('ما ناتج ' + _arNumber(a) + ' + ٧؟', a + 7, seed);
  }
}

String _clueText(CharacterInfo target, int combo) {
  switch (combo) {
    case 0: return 'المرتبط بعالم ' + target.universe;
    case 1: return 'الذي ' + target.role;
    case 2: return 'الذي ' + target.trait;
    case 3: return 'المرتبط بعالم ' + target.universe + ' والذي ' + target.role;
    case 4: return 'المرتبط بعالم ' + target.universe + ' والذي ' + target.trait;
    case 5: return 'الذي ' + target.role + ' و' + target.trait;
    default: return 'المرتبط بعالم ' + target.universe + ' والذي ' + target.role + ' و' + target.trait;
  }
}

Q _generateCharacterQuestion(int seed, bool animeMode) {
  final baseSalt = animeMode ? 141 : 131;
  final target = characterPool[_pick(seed, baseSalt, characterPool.length)];
  final combo = _pick(seed, baseSalt + 1, 7);
  final wording = _pick(seed, baseSalt + 2, 5);
  final clue = _clueText(target, combo);
  final text = switch (wording) {
    0 => 'من الشخصية ' + clue + '؟',
    1 => 'اختر الشخصية ' + clue + '.',
    2 => 'أي اسم يطابق الوصف: ' + clue + '؟',
    3 => 'خمن الشخصية: ' + clue + '؟',
    _ => 'من أنا؟ ' + clue + '؟',
  };
  final distractors = <String>[];
  for (var i = 1; distractors.length < 3; i++) {
    final candidate = characterPool[_pick(seed, baseSalt + 19 + i * 13, characterPool.length)].name;
    if (candidate != target.name && !distractors.contains(candidate)) distractors.add(candidate);
  }
  return _mcq(text, target.name, distractors, seed);
}

Q generateWhoQuestion(int seed) => _generateCharacterQuestion(seed, false);
Q generateAnimeQuestion(int seed) => _generateCharacterQuestion(seed, true);

Q generateRiddleQuestion(int seed) {
  switch (_pick(seed, 51, 8)) {
    case 0:
      final x = 5 + _pick(seed, 52, 80);
      final y = 2 + _pick(seed, 53, 30);
      return _numericQuestion('لغز: أنا عدد، إذا أضفت إلي ' + _arNumber(y) + ' أصبحت ' + _arNumber(x + y) + '. من أنا؟', x, seed);
    case 1:
      final total = 8 + _pick(seed, 54, 60);
      final used = 1 + _pick(seed, 55, total - 1);
      final extra = 1 + _pick(seed, 56, 20);
      return _numericQuestion('لغز: لديك ' + _arNumber(total) + ' قطعة، استخدمت ' + _arNumber(used) + ' ثم حصلت على ' + _arNumber(extra) + ' أخرى. كم أصبح لديك؟', total - used + extra, seed);
    case 2:
      final start = 2 + _pick(seed, 57, 20);
      final step = 2 + _pick(seed, 58, 12);
      return _numericQuestion('لغز: ' + _arNumber(start) + '، ' + _arNumber(start + step) + '، ' + _arNumber(start + step * 2) + '، ما العدد التالي؟', start + step * 3, seed);
    case 3:
      final shelves = 2 + _pick(seed, 60, 8);
      final each = 2 + _pick(seed, 61, 12);
      final total = shelves * each;
      return _numericQuestion('لغز: رتبت ' + _arNumber(total) + ' كتابًا بالتساوي على ' + _arNumber(shelves) + ' أرفف. كم كتابًا في كل رف؟', each, seed);
    case 4:
      final hour = 1 + _pick(seed, 62, 12);
      final add = 1 + _pick(seed, 63, 11);
      final answer = ((hour - 1 + add) % 12) + 1;
      return _numericQuestion('لغز الساعة: إذا كانت الساعة ' + _arNumber(hour) + ' وأضافت ' + _arNumber(add) + ' ساعات، فما رقم الساعة؟', answer, seed);
    case 5:
      final rows = 2 + _pick(seed, 64, 9);
      final cols = 2 + _pick(seed, 65, 9);
      return _numericQuestion('لغز: مستطيل فيه ' + _arNumber(rows) + ' صفوف و' + _arNumber(cols) + ' أعمدة. كم خانة فيه؟', rows * cols, seed);
    case 6:
      final base = 2 + _pick(seed, 66, 18);
      return _numericQuestion('لغز: لدي عدد، وعند مضاعفته يصبح ' + _arNumber(base * 2) + '. ما العدد؟', base, seed);
    default:
      final a = 3 + _pick(seed, 67, 15);
      final b = 2 + _pick(seed, 68, 10);
      final c = 1 + _pick(seed, 69, 9);
      return _numericQuestion('لغز: ابدأ بـ ' + _arNumber(a) + '، اضرب في ' + _arNumber(b) + ' ثم اطرح ' + _arNumber(c) + '. ما الناتج؟', a * b - c, seed);
  }
}

Q generateImpossibleQuestion(int seed) {
  switch (_pick(seed, 71, 8)) {
    case 0:
      final people = 3 + _pick(seed, 72, 8);
      return _mcq('في سباق تجاوزت الشخص الذي كان في المركز الثاني بين ' + _arNumber(people) + ' متسابقين. ما مركزك الآن؟','الثاني',['الأول','الثالث','الأخير'],seed);
    case 1:
      final apples = 3 + _pick(seed, 73, 12);
      final taken = 1 + _pick(seed, 74, min(apples, 4));
      return _mcq('لديك ' + _arNumber(apples) + ' تفاحات وأخذت ' + _arNumber(taken) + ' منها. كم تفاحة أصبحت معك؟',_arNumber(taken),[_arNumber(apples - taken),_arNumber(apples),_arNumber(apples + taken)],seed);
    case 2:
      return _mcq('أي شهر فيه ٢٨ يومًا؟','كل الشهور',['شهر فبراير فقط','ستة شهور','شهران'],seed);
    case 3:
      final number = 10 + _pick(seed, 75, 90);
      return _mcq('إذا كان لديك ' + _arNumber(number) + ' شمعة وأطفأت شمعة واحدة، كم شمعة تظل موجودة؟',_arNumber(number),[_arNumber(number - 1),'واحدة',_arNumber(number + 1)],seed);
    case 4:
      final age = 8 + _pick(seed, 76, 20);
      final years = 2 + _pick(seed, 77, 10);
      return _numericQuestion('شخص عمره ' + _arNumber(age) + ' سنوات. بعد ' + _arNumber(years) + ' سنوات، كم سيكون عمره؟',age + years,seed);
    case 5:
      return _mcq('أنت تقود حافلة. صعد ٥ ركاب، ثم نزل ٢ وصعد ٣. من يقود الحافلة؟','أنت',['الركاب','سائق آخر','لا أحد'],seed);
    case 6:
      final boxes = 2 + _pick(seed, 78, 8);
      return _numericQuestion('لديك ' + _arNumber(boxes) + ' صناديق، في كل صندوق ٤ كرات. كم كرة لديك؟',boxes * 4,seed);
    default:
      final minutes = 5 + _pick(seed, 79, 55);
      return _numericQuestion('بدأت مهمة ثم مرّ ' + _arNumber(minutes) + ' دقيقة. كم دقيقة مرّت؟',minutes,seed);
  }
}

const ratherPool = <String>[
  'تعيش يومًا بلا هاتف','تعيش يومًا بلا ألعاب','تتعلم لغة فورًا','تتعلم آلة فورًا',
  'تستكشف الفضاء','تستكشف أعماق المحيط','تملك ذاكرة مثالية','تملك تركيزًا مثاليًا',
  'تتحرك بسرعة خارقة','تستطيع الاختفاء','تقرأ أي خريطة فورًا','تفهم أي لغز من أول محاولة',
  'تسافر للماضي','تسافر للمستقبل','تملك غرفة ألعاب كبيرة','تملك مكتبة ضخمة',
  'تكون بطلًا ليوم واحد','تكون مخترعًا ليوم واحد','تعيش في مدينة ذكية','تعيش في جزيرة هادئة',
  'تجرب كل لعبة مرة','تجرب كل فيلم مرة','تتقن الطبخ فورًا','تتقن الرسم فورًا',
  'تتعلم العزف فورًا','تتذكر كل الوجوه','تستطيع التحدث مع الحيوانات','تفوز في أي لعبة ورق',
  'تملك روبوتًا مساعدًا','تعيش أسبوعًا بلا إنترنت','تجد أي شيء مفقود','تتعلم الطباعة بسرعة',
  'تسافر حول العالم','تعيش في مركبة ذكية','تملك غرفة سينما','تبدأ يومك من دون منبّه',
];

Q generateRatherQuestion(int seed) {
  final a = _pick(seed, 81, ratherPool.length);
  var b = _pick(seed, 82, ratherPool.length);
  if (a == b) b = (b + 1) % ratherPool.length;
  return Q('ماذا تفضل؟',['الخيار الأول: ' + ratherPool[a],'الخيار الثاني: ' + ratherPool[b]],_pick(seed, 83, 2));
}

Q generateTwentyQuestion(int seed) {
  const objects = ['الهاتف','الكتاب','السيارة','الدراجة','الحاسوب','الكرة','المظلة','الحقيبة','الساعة','المصباح','السماعة','الطائرة','القطار','القلم','الكاميرا','التلفاز','الحذاء','المفتاح','الطاولة','الشجرة','الباب','النافذة','الطعام','الكرسي'];
  const properties = ['يستخدم يوميًا','يمكن حمله','يوجد عادة في المنزل','يحتاج طاقة','يمكن نقله من مكان لآخر','مرتبط بالتقنية','له أكثر من استخدام','يمكن أن يكون مصنوعًا من المعدن','يمكن أن يكون له شاشة','يمكن أن يسبب ضوضاء','يمكن تنظيفه','يمكن أن يكون صغيرًا','يمكن أن يكون كبيرًا','يستخدم في السفر','يمكن مشاركته مع الآخرين','يمكن إصلاحه','يمكن شراؤه من متجر','قد يكون له زر','يمكن أن يكون له لون مختلف','يمكن تخزينه'];
  final object = objects[_pick(seed, 91, objects.length)];
  final property = properties[_pick(seed, 92, properties.length)];
  final answer = _pick(seed, 93, 2);
  return Q('هل ' + object + ' ' + property + '؟',['نعم','لا'],answer);
}

Q generateClueQuestion(int seed) => generateWhoQuestion(seed + 7000);

Q generateMathQuestion(int seed) {
  final a = 2 + _pick(seed, 111, 80);
  final b = 1 + _pick(seed, 112, 60);
  switch (_pick(seed, 113, 4)) {
    case 0: return _numericQuestion(_arNumber(a) + ' + ' + _arNumber(b) + ' = ؟',a+b,seed);
    case 1:
      final high = max(a,b);
      final low = min(a,b);
      return _numericQuestion(_arNumber(high) + ' − ' + _arNumber(low) + ' = ؟',high-low,seed);
    case 2:
      final multiplier = b % 15 + 2;
      return _numericQuestion(_arNumber(a) + ' × ' + _arNumber(multiplier) + ' = ؟',a*multiplier,seed);
    default:
      final d = 2 + _pick(seed, 114, 9);
      final q = 2 + _pick(seed, 115, 20);
      return _numericQuestion(_arNumber(d*q) + ' ÷ ' + _arNumber(d) + ' = ؟',q,seed);
  }
}

Q generateSequenceQuestion(int seed) {
  final start = 1 + _pick(seed, 121, 25);
  final step = 1 + _pick(seed, 122, 12);
  if (_pick(seed, 123, 2) == 0) {
    return _numericQuestion(_arNumber(start) + '، ' + _arNumber(start+step) + '، ' + _arNumber(start+step*2) + '، ' + _arNumber(start+step*3) + '، ؟',start+step*4,seed);
  }
  final multiplier = 2 + _pick(seed, 124, 3);
  final answer = start * pow(multiplier,3).toInt();
  return _numericQuestion(_arNumber(start) + '، ' + _arNumber(start*multiplier) + '، ' + _arNumber(start*multiplier*multiplier) + '، ؟',answer,seed);
}

Q generateTrueFalseQuestion(int seed) {
  final a = 2 + _pick(seed, 131, 99);
  final b = 1 + _pick(seed, 132, 99);
  final actual = a + b;
  final truth = _pick(seed, 133, 2) == 0;
  final shown = truth ? actual : actual + 1 + _pick(seed, 134, 5);
  final correct = truth ? 'صح' : 'غلط';
  final wrong = truth ? 'غلط' : 'صح';
  return Q('هل العبارة صحيحة؟ ' + _arNumber(a) + ' + ' + _arNumber(b) + ' = ' + _arNumber(shown),[correct,wrong],0);
}

Q generateCompareQuestion(int seed) {
  final a = 5 + _pick(seed, 141, 5000);
  var b = 5 + _pick(seed, 142, 5000);
  if (a == b) b++;
  final correct = a > b ? _arNumber(a) : _arNumber(b);
  final smaller = a > b ? _arNumber(b) : _arNumber(a);
  return _mcq('أي عدد أكبر: ' + _arNumber(a) + ' أم ' + _arNumber(b) + '؟',correct,[smaller,'متساويان',_arNumber(max(a,b)+1)],seed);
}

class EndlessQuestionGame extends StatefulWidget {
  final String title;
  final Q Function(int seed) generator;
  const EndlessQuestionGame({super.key,required this.title,required this.generator});
  @override State<EndlessQuestionGame> createState()=>_EndlessQuestionGameState();
}

class _EndlessQuestionGameState extends State<EndlessQuestionGame> {
  final used=<String>{};
  var serial=0;
  late Q current;
  int score=0,questionNumber=1;
  int? picked;

  Q _nextUnique(){
    for(var attempt=0;attempt<1000;attempt++){
      final q=widget.generator(serial++);
      if(used.add(q.key))return q;
    }
    throw StateError('تعذر توليد سؤال جديد فريد');
  }

  @override void initState(){super.initState();current=_nextUnique();}

  void answer(int option){
    if(picked!=null)return;
    setState((){
      picked=option;
      if(option==current.answer)score++;
    });
  }

  void next(){
    setState((){
      current=_nextUnique();
      questionNumber++;
      picked=null;
    });
  }

  @override Widget build(BuildContext context)=>Padding(
    padding:const EdgeInsets.all(18),
    child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
      Text('السؤال ' + _arNumber(questionNumber) + ' • النقاط ' + _arNumber(score),textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
      const SizedBox(height:18),
      Text(current.text,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
      const SizedBox(height:18),
      ...List.generate(current.options.length,(i)=>Padding(padding:const EdgeInsets.only(bottom:9),child:FilledButton.tonal(onPressed:picked==null?()=>answer(i):null,child:Text(current.options[i],textAlign:TextAlign.center)))),
      const Spacer(),
      if(picked!=null)Text(picked==current.answer?'إجابة صحيحة':'إجابة غير صحيحة',textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
      const SizedBox(height:10),
      FilledButton(onPressed:picked==null?null:next,child:const Text('السؤال التالي')),
    ]),
  );
}

class TriviaGame extends StatelessWidget{
  const TriviaGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'المسابقة المتنوعة',generator:generateTriviaQuestion);
}
class WhoGame extends StatelessWidget{
  const WhoGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'من أنا؟',generator:generateWhoQuestion);
}
class RiddleGame extends StatelessWidget{
  const RiddleGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'الألغاز',generator:generateRiddleQuestion);
}
class AnimeGame extends StatelessWidget{
  const AnimeGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'مسابقة الأنمي',generator:generateAnimeQuestion);
}
class ImpossibleGame extends StatelessWidget{
  const ImpossibleGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'المسابقة الخادعة',generator:generateImpossibleQuestion);
}
class MathQuizGame extends StatelessWidget{
  const MathQuizGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'الحساب السريع',generator:generateMathQuestion);
}
class SequenceGame extends StatelessWidget{
  const SequenceGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'نمط الأرقام',generator:generateSequenceQuestion);
}
class TrueFalseGame extends StatelessWidget{
  const TrueFalseGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'صح أم غلط',generator:generateTrueFalseQuestion);
}
class CompareGame extends StatelessWidget{
  const CompareGame({super.key});
  @override Widget build(BuildContext context)=>EndlessQuestionGame(title:'الأكبر؟',generator:generateCompareQuestion);
}

class TwentyQ extends StatefulWidget {
  const TwentyQ({super.key});
  @override State<TwentyQ> createState()=>_TwentyQState();
}
class _TwentyQState extends State<TwentyQ>{
  final rounds=const[
    ['هل هي كائن حي؟','هل تتحرك؟','هل يمكن الإمساك بها؟','هل تستخدم يوميًا؟','هل توجد في المنزل؟','هل تحتاج طاقة؟','هل ترتبط بالتقنية؟','هل يمكن حملها؟'],
    ['هل هي لعبة؟','هل تحتاج لاعبًا؟','هل لها قواعد؟','هل تستخدم ألوانًا؟','هل تلعب فرديًا؟','هل تعتمد على السرعة؟','هل فيها نقاط؟','هل يمكن تعلمها بسرعة؟'],
    ['هل هي وسيلة نقل؟','هل تتحرك على طريق؟','هل لها عجلات؟','هل تستخدم وقودًا؟','هل تتسع لأكثر من شخص؟','هل لها مقود؟','هل تستخدم داخل مدينة؟','هل تناسب رحلة طويلة؟'],
  ];
  int round=0,index=0,yes=0;
  void answer(bool value){setState((){if(value)yes++;index++;if(index==rounds[round].length){round=(round+1)%rounds.length;index=0;yes=0;}});}
  @override Widget build(BuildContext context){final q=rounds[round];return Center(child:Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('السؤال '+(index+1).toString()+'/'+q.length.toString(),style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
    const SizedBox(height:18),Text(q[index],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:22)),
    const SizedBox(height:10),Text('إجابات نعم: '+yes.toString(),style:const TextStyle(color:Colors.white)),const SizedBox(height:22),
    Row(children:[Expanded(child:FilledButton(onPressed:()=>answer(true),child:const Text('نعم'))),const SizedBox(width:10),Expanded(child:FilledButton.tonal(onPressed:()=>answer(false),child:const Text('لا')))]),
  ])));}}

class ClueGame extends StatelessWidget {
  const ClueGame({super.key});
  @override Widget build(BuildContext context)=>const EndlessQuestionGame(title:'خمن الشخصية',generator:generateClueQuestion);
}


class RatherGame extends StatefulWidget{
  const RatherGame({super.key});
  @override State<RatherGame> createState()=>_RatherState();
}
class _RatherState extends State<RatherGame>{
  final used=<String>{};
  var serial=0;
  late Q current;
  bool chosen=false;
  Q _nextUnique(){
    for(var attempt=0;attempt<1000;attempt++){
      final q=generateRatherQuestion(serial++);
      if(used.add(q.key))return q;
    }
    throw StateError('تعذر توليد اختيار جديد فريد');
  }
  @override void initState(){super.initState();current=_nextUnique();}
  void choose(int value){if(chosen)return;setState(()=>chosen=true);}
  void next()=>setState((){current=_nextUnique();chosen=false;});
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('الجولة ' + _arNumber(used.length),style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
    const SizedBox(height:12),
    Text(current.text,style:const TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w900)),
    const SizedBox(height:22),
    ...List.generate(current.options.length,(i)=>Padding(padding:const EdgeInsets.only(bottom:10),child:SizedBox(width:double.infinity,child:FilledButton.tonal(onPressed:chosen?null:()=>choose(i),child:Text(current.options[i],textAlign:TextAlign.center))))),
    if(chosen)const Text('اختيارك محفوظ للجولة',style:TextStyle(color:Colors.white)),
    const SizedBox(height:14),
    FilledButton(onPressed:chosen?next:null,child:const Text('ماذا بعد؟')),
  ]));
}

class WordGame extends StatefulWidget{
  const WordGame({super.key});
  @override State<WordGame> createState()=>_WordState();
}
class _WordState extends State<WordGame>{
  final controller=TextEditingController();
  final words=<String>[];
  String message='ابدأ بأي كلمة عربية من حرفين أو أكثر';
  @override void dispose(){controller.dispose();super.dispose();}
  void add(){
    final word=controller.text.trim();
    if(word.length<2){setState(()=>message='اكتب كلمة أطول');return;}
    if(words.contains(word)){setState(()=>message='هذه الكلمة استُخدمت بالفعل');return;}
    if(words.isNotEmpty&&word.runes.first!=words.last.runes.last){setState(()=>message='ابدأ بحرف '+words.last.substring(words.last.length-1));return;}
    setState((){words.add(word);controller.clear();message='الكلمة التالية تبدأ بحرف '+word.substring(word.length-1);});
  }
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(18),child:Column(children:[
    Text('النقاط: '+words.length.toString(),style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
    Text(message,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),const SizedBox(height:10),
    TextField(controller:controller,textDirection:TextDirection.rtl),FilledButton(onPressed:add,child:const Text('أضف الكلمة')),
    Expanded(child:ListView(children:words.reversed.map((x)=>ListTile(title:Text(x,style:const TextStyle(color:Colors.white)))).toList())),
  ]));
}
class ImpostorGame extends StatefulWidget{
  const ImpostorGame({super.key});
  @override State<ImpostorGame> createState()=>_ImpostorState();
}
class _ImpostorState extends State<ImpostorGame>{
  final random=Random();
  final places=const['محطة القطار','المكتبة','المتحف','الحديقة','الملعب'];
  int player=0,odd=0,round=1;bool reveal=false;
  @override void initState(){super.initState();odd=random.nextInt(4);}
  void nextPlayer(){setState((){if(player==3){player=0;odd=random.nextInt(4);round++;}else{player++;}reveal=false;});}
  @override Widget build(BuildContext context){final place=places[round%places.length];return Padding(padding:const EdgeInsets.all(20),child:Column(children:[
    Text('الجولة $round',style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w700)),
    Text('اللاعب '+(player+1).toString(),style:const TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w900)),
    const Spacer(),GestureDetector(onTap:()=>setState(()=>reveal=!reveal),child:Card(color:const Color(0xFF111111),child:Padding(padding:const EdgeInsets.all(35),child:Text(reveal?(player==odd?'أنت المتسلل':'الموقع: '+place):'اضغط للكشف',textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))))),
    const Spacer(),FilledButton(onPressed:nextPlayer,child:Text(player==3?'جولة جديدة':'اللاعب التالي')),
  ]));}
}
class StoryGame extends StatefulWidget {
  const StoryGame({super.key});
  @override State<StoryGame> createState()=>_StoryState();
}
class _StoryState extends State<StoryGame>{
  final scenes=const[
    ['محطة مهجورة تقود إلى نفق وباب حديدي.','ادخل النفق','افحص الباب'],
    ['في النفق خريطة وفتحة صغيرة.','خذ الخريطة','استكشف الفتحة'],
    ['خلف الباب غرفة فيها شاشة قديمة.','شغّل الشاشة','ابحث عن مفتاح'],
    ['وجدت ممرًا سريًا ينقسم إلى طريقين.','اختر الطريق الأيسر','اختر الطريق الأيمن'],
  ];
  int scene=0;
  void choose(int branch)=>setState(()=>scene=(scene+branch+1)%scenes.length);
  @override Widget build(BuildContext context){final x=scenes[scene];return Center(child:Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text(x[0],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
    const SizedBox(height:22),FilledButton(onPressed:()=>choose(0),child:Text(x[1])),const SizedBox(height:10),FilledButton.tonal(onPressed:()=>choose(1),child:Text(x[2])),
  ])));}}
class DungeonGame extends StatefulWidget {
  const DungeonGame({super.key});
  @override State<DungeonGame> createState()=>_DungeonState();
}
class _DungeonState extends State<DungeonGame>{
  final paths=const[
    ['بوابة حجرية تحرس ممرًا مظلمًا.','افتح البوابة','ابحث عن مفتاح'],
    ['ممر تحت الأرض ينتهي بثلاثة أبواب.','اختر الباب الأزرق','اختر الباب البرونزي'],
    ['غرفة قديمة فيها صندوق وصوت خافت.','افتح الصندوق','تتبع الصوت'],
    ['ساحة واسعة يظهر فيها طريق جديد.','امش نحو الضوء','اختبر الممر الجانبي'],
  ];int index=0;
  void next()=>setState(()=>index=(index+1)%paths.length);
  @override Widget build(BuildContext context){final x=paths[index];return Center(child:Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('الزنزانة '+(index+1).toString(),style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
    const SizedBox(height:12),Text(x[0],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),
    const SizedBox(height:20),FilledButton(onPressed:next,child:Text(x[1])),const SizedBox(height:10),FilledButton.tonal(onPressed:next,child:Text(x[2])),
  ])));}}
class DetectiveGame extends StatefulWidget {
  const DetectiveGame({super.key});
  @override State<DetectiveGame> createState()=>_DetectiveState();
}
class _DetectiveState extends State<DetectiveGame>{
  final cases=const[
    ['القضية الأولى: اختفى ملف من غرفة مغلقة.','الساعة توقفت عند التاسعة وعشر دقائق.','ندى','سامي','رامي'],
    ['القضية الثانية: اختفى مفتاح من مكتب الاستقبال.','كاميرا الممر توقفت لدقيقتين فقط.','ليلى','مازن','هالة'],
    ['القضية الثالثة: اختفت قطعة من صندوق العرض.','آخر حركة سُجلت قبل الإغلاق مباشرة.','عمر','مينا','سلمى'],
  ];
  final answers=const[1,0,2];int index=0;String message='اختر المشتبه به';
  void solve(int choice)=>setState((){if(choice==answers[index]){message='استنتاج صحيح، قضية جديدة';index=(index+1)%cases.length;}else{message='الاستنتاج غير صحيح، حاول مرة أخرى';}});
  @override Widget build(BuildContext context){final x=cases[index];return Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
    Text(x[0],style:const TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w900)),const SizedBox(height:10),Text(x[1],style:const TextStyle(color:Colors.white)),const Spacer(),Text(message,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),const SizedBox(height:12),
    FilledButton.tonal(onPressed:()=>solve(0),child:Text('المشتبه: '+x[2])),FilledButton.tonal(onPressed:()=>solve(1),child:Text('المشتبه: '+x[3])),FilledButton.tonal(onPressed:()=>solve(2),child:Text('المشتبه: '+x[4])),
  ]));}}

class BattleGame extends StatefulWidget{
  const BattleGame({super.key});
  @override State<BattleGame> createState()=>_BattleState();
}
class _BattleState extends State<BattleGame>{
  final used=<String>{};
  var serial=0;
  late Q current;
  Timer? timer;
  int sec=30,score=0,combo=0,questionNumber=1;
  int? picked;
  Q _nextUnique(){
    for(var attempt=0;attempt<1000;attempt++){
      final q=generateTriviaQuestion(serial++);
      if(used.add(q.key))return q;
    }
    throw StateError('تعذر توليد سؤال معركة فريد');
  }
  @override void initState(){
    super.initState();
    current=_nextUnique();
    timer=Timer.periodic(const Duration(seconds:1),(_)=>tick());
  }
  @override void dispose(){timer?.cancel();super.dispose();}
  void tick(){
    if(!mounted)return;
    if(sec<=1){
      setState((){current=_nextUnique();sec=30;combo=0;picked=null;questionNumber++;});
    }else{
      setState(()=>sec--);
    }
  }
  void answer(int n){
    if(picked!=null)return;
    setState((){picked=n;if(n==current.answer){combo++;score+=10+combo;}else{combo=0;}});
  }
  void next()=>setState((){current=_nextUnique();picked=null;sec=30;questionNumber++;});
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
      Text('الوقت ' + _arNumber(sec),style:const TextStyle(color:Colors.white)),
      Text('السلسلة ' + _arNumber(combo),style:const TextStyle(color:Colors.white)),
      Text('النقاط ' + _arNumber(score),style:const TextStyle(color:Colors.white)),
    ]),
    const SizedBox(height:18),
    Text('السؤال ' + _arNumber(questionNumber),textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w700)),
    const SizedBox(height:10),
    Text(current.text,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
    const SizedBox(height:12),
    ...List.generate(current.options.length,(n)=>Padding(padding:const EdgeInsets.only(bottom:8),child:FilledButton.tonal(onPressed:picked==null?()=>answer(n):null,child:Text(current.options[n])))),
    const Spacer(),
    if(picked!=null)Text(picked==current.answer?'إجابة صحيحة':'إجابة غير صحيحة',textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),
    const SizedBox(height:10),
    FilledButton(onPressed:picked==null?null:next,child:const Text('التالي')),
  ]));
}

class MemoryGame extends StatefulWidget{
  const MemoryGame({super.key});
  @override State<MemoryGame>createState()=>_MemoryState();
}
class _MemoryState extends State<MemoryGame>{
  final random=Random();
  List<int>sequence=[],input=[];
  int level=1;bool showing=false;String message='اضغط ابدأ';
  void startGame() async{
    sequence=List.generate(level+2,(_)=>random.nextInt(4));input=[];
    setState(()=>showing=true);
    for(final value in sequence){
      await Future.delayed(const Duration(milliseconds:450));
      if(!mounted)return;setState(()=>input=[value]);
      await Future.delayed(const Duration(milliseconds:250));
      if(!mounted)return;setState(()=>input=[]);
    }
    if(mounted)setState(()=>{showing=false,message='كرر التسلسل';});
  }
  void tap(int value){
    if(showing||sequence.isEmpty)return;
    final i=input.length;
    if(i>=sequence.length||sequence[i]!=value){
      setState((){level=1;sequence=[];input=[];message='جولة جديدة تبدأ الآن';});
      Future.delayed(const Duration(milliseconds:350),(){if(mounted)startGame();});
      return;
    }
    final done=i+1==sequence.length;
    setState((){input=[...input,value];if(done){level++;sequence=[];input=[];message='ممتاز، مستوى جديد';}});
    if(done)Future.delayed(const Duration(milliseconds:400),(){if(mounted)startGame();});
  }
  @override Widget build(BuildContext context)=>Column(children:[
    const SizedBox(height:12),
    Text('المستوى $level',style:const TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w900)),
    Text(message,style:const TextStyle(color:Colors.white)),
    Expanded(child:GridView.count(crossAxisCount:2,padding:const EdgeInsets.all(24),crossAxisSpacing:14,mainAxisSpacing:14,
      children:List.generate(4,(i)=>GestureDetector(onTap:()=>tap(i),child:Container(
        decoration:BoxDecoration(color:input.contains(i)?const Color(0xFF444444):const Color(0xFF222222),borderRadius:BorderRadius.circular(22)),
        child:Center(child:Text((i+1).toString(),style:const TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.w900))),
      ))))),
    FilledButton(onPressed:showing?null:startGame,child:const Text('ابدأ')),
  ]);
}

class SnakeGame extends StatefulWidget{
  const SnakeGame({super.key});
  @override State<SnakeGame>createState()=>_SnakeState();
}
class _SnakeState extends State<SnakeGame>{
  static const size=12;final random=Random();
  List<Point<int>>snake=const[Point(5,6),Point(4,6),Point(3,6)];
  Point<int>food=const Point(9,6),direction=const Point(1,0);
  Timer?timer;int score=0;
  @override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:180),(_)=>tick());}
  @override void dispose(){timer?.cancel();super.dispose();}
  void turn(Point<int>next){if(direction.x+next.x==0&&direction.y+next.y==0)return;direction=next;}
  void tick(){
    if(!mounted)return;final head=snake.first,next=Point(head.x+direction.x,head.y+direction.y);
    if(next.x<0||next.y<0||next.x>=size||next.y>=size||snake.contains(next)){reset(true);return;}
    final nextSnake=[next,...snake];
    if(next==food){score++;do{food=Point(random.nextInt(size),random.nextInt(size));}while(nextSnake.contains(food));}else{nextSnake.removeLast();}
    setState(()=>snake=nextSnake);
  }
  void reset([bool preserve=false]){if(!preserve)score=0;setState((){snake=const[Point(5,6),Point(4,6),Point(3,6)];food=Point(random.nextInt(size),random.nextInt(size));direction=const Point(1,0);});}
  @override Widget build(BuildContext context)=>Column(children:[
    Text('النقاط: $score',style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
    Expanded(child:Center(child:AspectRatio(aspectRatio:1,child:GridView.builder(
      physics:const NeverScrollableScrollPhysics(),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:size),itemCount:size*size,
      itemBuilder:(_,i){final q=Point(i%size,i~/size);return Container(margin:const EdgeInsets.all(1),
        color:q==food?const Color(0xFF333333):snake.contains(q)?const Color(0xFF555555):const Color(0xFF111111),
        child:Center(child:Text(q==food?'◆':snake.contains(q)?'●':'',style:const TextStyle(color:Colors.white,fontSize:14))));
      },
    )))),
    Wrap(children:[
      IconButton(onPressed:()=>turn(const Point(0,-1)),icon:const Icon(Icons.keyboard_arrow_up)),
      IconButton(onPressed:()=>turn(const Point(-1,0)),icon:const Icon(Icons.keyboard_arrow_left)),
      IconButton(onPressed:()=>turn(const Point(1,0)),icon:const Icon(Icons.keyboard_arrow_right)),
      IconButton(onPressed:()=>turn(const Point(0,1)),icon:const Icon(Icons.keyboard_arrow_down)),
      IconButton(onPressed:reset,icon:const Icon(Icons.refresh)),
    ]),
  ]);
}

class Game2048 extends StatefulWidget{
  const Game2048({super.key});
  @override State<Game2048>createState()=>_Game2048State();
}
class _Game2048State extends State<Game2048>{
  final random=Random();List<int>board=List.filled(16,0);int score=0;
  @override void initState(){super.initState();reset();}
  void reset(){board=List.filled(16,0);score=0;spawn();spawn();setState((){});}
  void spawn(){final empty=[for(int i=0;i<16;i++)if(board[i]==0)i];if(empty.isNotEmpty)board[empty[random.nextInt(empty.length)]]=random.nextInt(10)==0?4:2;}
  List<int>merge(List<int>v){final compact=v.where((x)=>x!=0).toList();final out=<int>[];for(int i=0;i<compact.length;i++){if(i+1<compact.length&&compact[i]==compact[i+1]){final x=compact[i]*2;out.add(x);score+=x;i++;}else{out.add(compact[i]);}}while(out.length<4)out.add(0);return out;}
  void move(int d){
    final old=List<int>.from(board);
    for(int line=0;line<4;line++){var values=d<2?[for(int row=0;row<4;row++)board[row*4+line]]:board.sublist(line*4,line*4+4);final reverse=d==1||d==3;if(reverse)values=values.reversed.toList();values=merge(values);if(reverse)values=values.reversed.toList();if(d<2){for(int row=0;row<4;row++)board[row*4+line]=values[row];}else{board.replaceRange(line*4,line*4+4,values);}}
    if(!_same(old,board))spawn();else if(_noMove())reset();setState((){});
  }
  bool _same(List<int>a,List<int>b){for(int i=0;i<a.length;i++)if(a[i]!=b[i])return false;return true;}
  bool _noMove(){if(board.contains(0))return false;for(int r=0;r<4;r++)for(int x=0;x<4;x++){final v=board[r*4+x];if(r<3&&board[(r+1)*4+x]==v)return false;if(x<3&&board[r*4+x+1]==v)return false;}return true;}
  @override Widget build(BuildContext context)=>Column(children:[
    const SizedBox(height:12),Text('النقاط: $score',style:const TextStyle(color:Colors.white)),
    Expanded(child:Center(child:AspectRatio(aspectRatio:1,child:GridView.builder(
      physics:const NeverScrollableScrollPhysics(),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4,crossAxisSpacing:6,mainAxisSpacing:6),itemCount:16,
      itemBuilder:(_,i)=>Container(color:board[i]==0?const Color(0xFF111111):const Color(0xFF202020),child:Center(child:Text(board[i]==0?'':board[i].toString(),style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w900,fontSize:21)))),
    )))),
    Wrap(children:[IconButton(onPressed:()=>move(0),icon:const Icon(Icons.keyboard_arrow_up)),IconButton(onPressed:()=>move(2),icon:const Icon(Icons.keyboard_arrow_left)),IconButton(onPressed:()=>move(3),icon:const Icon(Icons.keyboard_arrow_right)),IconButton(onPressed:()=>move(1),icon:const Icon(Icons.keyboard_arrow_down)),IconButton(onPressed:reset,icon:const Icon(Icons.refresh))]),
  ]);
}

class TetrisGame extends StatefulWidget{
  const TetrisGame({super.key});
  @override State<TetrisGame>createState()=>_TetrisState();
}
class _TetrisState extends State<TetrisGame>{
  static const columns=8,rows=16;Timer?timer;int x=3,y=0,score=0;List<int>cells=List.filled(columns*rows,0);
  @override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:450),(_)=>fall());}
  @override void dispose(){timer?.cancel();super.dispose();}
  void fall(){if(!mounted)return;if(y<rows-1){setState(()=>y++);}else{setState((){cells[(rows-1)*columns+x]=1;y=0;score++;if(cells.every((v)=>v!=0))cells=List.filled(columns*rows,0);});}}
  void reset(){setState((){cells=List.filled(columns*rows,0);x=3;y=0;score=0;});}
  @override Widget build(BuildContext context)=>Column(children:[
    Expanded(child:Center(child:AspectRatio(aspectRatio:columns/rows,child:GridView.builder(physics:const NeverScrollableScrollPhysics(),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:columns),itemCount:cells.length,itemBuilder:(_,i){final cx=i%columns,cy=i~/columns;return Container(margin:const EdgeInsets.all(1),color:(cx==x&&cy==y)||cells[i]!=0?const Color(0xFF444444):const Color(0xFF111111));})))),
    Text('النقاط: $score',style:const TextStyle(color:Colors.white)),Row(mainAxisAlignment:MainAxisAlignment.center,children:[
      IconButton(onPressed:()=>setState(()=>x=max(0,x-1)),icon:const Icon(Icons.keyboard_arrow_left)),IconButton(onPressed:fall,icon:const Icon(Icons.keyboard_arrow_down)),IconButton(onPressed:()=>setState(()=>x=min(columns-1,x+1)),icon:const Icon(Icons.keyboard_arrow_right)),IconButton(onPressed:reset,icon:const Icon(Icons.refresh)),
    ]),
  ]);
}

class MinesGame extends StatefulWidget{
  const MinesGame({super.key});
  @override State<MinesGame>createState()=>_MinesState();
}
class _MinesState extends State<MinesGame>{
  final random=Random();Set<int>mines={};List<bool>opened=List.filled(64,false);bool over=false;
  @override void initState(){super.initState();reset();}
  void reset(){mines={};while(mines.length<10)mines.add(random.nextInt(64));opened=List.filled(64,false);over=false;setState((){});}
  void tap(int i){if(over||opened[i])return;opened[i]=true;if(mines.contains(i)){over=true;setState((){});Future.delayed(const Duration(milliseconds:350),(){if(mounted)reset();});}else{setState((){});}}
  @override Widget build(BuildContext context)=>Column(children:[
    Text(over?'جولة جديدة الآن':'كاسحة الألغام',style:const TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900)),
    Expanded(child:GridView.builder(padding:const EdgeInsets.all(18),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:8,crossAxisSpacing:4,mainAxisSpacing:4),itemCount:64,itemBuilder:(_,i)=>InkWell(onTap:()=>tap(i),child:Container(color:opened[i]?const Color(0xFF333333):const Color(0xFF181818),child:Center(child:Text(opened[i]?'•':'',style:const TextStyle(color:Colors.white))))))),
    FilledButton(onPressed:reset,child:const Text('إعادة')),
  ]);
}

class PongGame extends StatefulWidget{const PongGame({super.key});@override State<PongGame>createState()=>_PongState();}
class _PongState extends State<PongGame>{
  double paddle=.5,bx=.5,by=.5,vx=.008,vy=.009;int score=0;Timer?timer;
  @override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:30),(_){if(!mounted)return;setState((){bx+=vx;by+=vy;if(bx<.02||bx>.98)vx=-vx;if(by<.02)vy=vy.abs();if(by>.92){if((bx-paddle).abs()<.16){vy=-vy.abs();score++;}else{bx=.5;by=.5;}}});});}
  @override void dispose(){timer?.cancel();super.dispose();}
  @override Widget build(BuildContext context)=>Column(children:[Text('النقاط: $score',style:const TextStyle(color:Colors.white)),Expanded(child:GestureDetector(onHorizontalDragUpdate:(d)=>setState(()=>paddle=(paddle+d.delta.dx/280).clamp(.12,.88)),child:CustomPaint(painter:PongPainter(bx,by,paddle),child:const SizedBox.expand()))),const Text('حرّك المضرب بالسحب',style:const TextStyle(color:Colors.white))]);
}
class PongPainter extends CustomPainter{
  final double x,y,p;PongPainter(this.x,this.y,this.p);
  @override void paint(Canvas c,Size s){final paint=Paint()..color=Colors.white;c.drawCircle(Offset(x*s.width,y*s.height),8,paint);c.drawRect(Rect.fromCenter(center:Offset(p*s.width,s.height-22),width:100,height:10),paint);}
  @override bool shouldRepaint(covariant PongPainter old)=>true;
}

class FlappyGame extends StatefulWidget{const FlappyGame({super.key});@override State<FlappyGame>createState()=>_FlappyState();}
class _FlappyState extends State<FlappyGame>{
  double bird=.5,velocity=0,pipe=1;int score=0;Timer?timer;
  @override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:30),(_){if(!mounted)return;setState((){velocity+=.0017;bird+=velocity;pipe-=.006;if(pipe<-.2){pipe=1.1;score++;}if(bird<.02||bird>.98){bird=.5;velocity=0;pipe=1;}});});}
  @override void dispose(){timer?.cancel();super.dispose();}
  void flap()=>setState(()=>velocity=-.028);
  @override Widget build(BuildContext context)=>GestureDetector(onTap:flap,child:Stack(children:[Positioned.fill(child:CustomPaint(painter:FlappyPainter(bird,pipe))),Center(child:Text('النقاط: $score',style:const TextStyle(color:Colors.white,fontSize:25,fontWeight:FontWeight.w900)))]));
}
class FlappyPainter extends CustomPainter{
  final double bird,pipe;FlappyPainter(this.bird,this.pipe);
  @override void paint(Canvas c,Size s){final paint=Paint()..color=Colors.white;c.drawCircle(Offset(s.width*.25,s.height*bird),13,paint);c.drawRect(Rect.fromLTWH(s.width*pipe,0,50,s.height*.5-130),paint);c.drawRect(Rect.fromLTWH(s.width*pipe,s.height*.5+130,50,s.height),paint);}
  @override bool shouldRepaint(covariant FlappyPainter old)=>true;
}

class ReactionGame extends StatefulWidget{const ReactionGame({super.key});@override State<ReactionGame>createState()=>_ReactionState();}
class _ReactionState extends State<ReactionGame>{
  final random=Random();bool waiting=false,go=false;DateTime?start;Timer?timer;String text='اضغط للبدء';
  @override void dispose(){timer?.cancel();super.dispose();}
  void tap(){
    if(!waiting){setState((){waiting=true;text='انتظر...';});timer=Timer(Duration(milliseconds:1000+random.nextInt(1800)),(){if(mounted)setState((){go=true;start=DateTime.now();text='الآن!';});});return;}
    if(!go){timer?.cancel();setState((){waiting=false;text='مبكر جدًا، جولة جديدة';});return;}
    final ms=DateTime.now().difference(start!).inMilliseconds;setState((){waiting=false;go=false;text='زمن الاستجابة: '+ms.toString()+' مللي ثانية';});
  }
  @override Widget build(BuildContext context)=>GestureDetector(onTap:tap,child:Center(child:Text(text,style:const TextStyle(color:Colors.white,fontSize:38,fontWeight:FontWeight.w900))));
}

class TypingGame extends StatefulWidget{const TypingGame({super.key});@override State<TypingGame>createState()=>_TypingState();}
class _TypingState extends State<TypingGame>{
  final controller=TextEditingController();
  final prompts=const['البرمجة تجعل الأفكار ألعابًا ممتعة.','الألعاب الصغيرة تحتاج تركيزًا وسرعة.','كل جولة تمنحك تحديًا عربيًا جديدًا.','اكتب بدقة قبل زيادة السرعة.'];
  int index=0;DateTime?start;String message='اكتب الجملة كما تظهر';
  @override void dispose(){controller.dispose();super.dispose();}
  void check(){start??=DateTime.now();if(controller.text==prompts[index]){final ms=max(1,DateTime.now().difference(start!).inMilliseconds);setState((){message='أنهيتها خلال '+(ms/1000).toStringAsFixed(2)+' ثانية';index=(index+1)%prompts.length;controller.clear();start=null;});}}
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(18),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text(prompts[index],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:23,fontWeight:FontWeight.w900)),const SizedBox(height:18),
    TextField(controller:controller,onChanged:(_)=>check(),maxLines:3,textDirection:TextDirection.rtl),const SizedBox(height:12),Text(message,style:const TextStyle(color:Colors.white)),
  ]));
}

class ClickerGame extends StatefulWidget{const ClickerGame({super.key});@override State<ClickerGame>createState()=>_ClickerState();}
class _ClickerState extends State<ClickerGame>{
  int score=0,sec=10;Timer?timer;
  @override void initState(){super.initState();timer=Timer.periodic(const Duration(seconds:1),(_){if(!mounted)return;setState((){sec--;if(sec<=0){sec=10;score=0;}});});}
  @override void dispose(){timer?.cancel();super.dispose();}
  void tap()=>setState(()=>score++);
  @override Widget build(BuildContext context)=>GestureDetector(onTap:tap,child:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('الوقت: $sec',style:const TextStyle(color:Colors.white)),Text('النقاط: $score',style:const TextStyle(color:Colors.white,fontSize:42,fontWeight:FontWeight.w900)),const Icon(Icons.touch_app,size:90,color:Colors.white),
  ])));
}

class NumberGame extends StatefulWidget{const NumberGame({super.key});@override State<NumberGame>createState()=>_NumberState();}
class _NumberState extends State<NumberGame>{
  final controller=TextEditingController();final random=Random();int target=0;String message='خمن رقمًا من 1 إلى 100';
  @override void initState(){super.initState();target=1+random.nextInt(100);}
  @override void dispose(){controller.dispose();super.dispose();}
  void check(){final n=int.tryParse(controller.text);if(n==null)return;setState((){if(n==target){message='صحيح، رقم جديد';target=1+random.nextInt(100);controller.clear();}else{message=n<target?'أعلى':'أقل';}});}
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text(message,style:const TextStyle(color:Colors.white,fontSize:27,fontWeight:FontWeight.w900)),TextField(controller:controller,keyboardType:TextInputType.number,textDirection:TextDirection.ltr),FilledButton(onPressed:check,child:const Text('خمن')),
  ]));
}

class RpsGame extends StatefulWidget{const RpsGame({super.key});@override State<RpsGame>createState()=>_RpsState();}
class _RpsState extends State<RpsGame>{
  final random=Random();final choices=['حجر','ورق','مقص'];String message='اختر';
  void play(int player){final cpu=random.nextInt(3);final win=(player==0&&cpu==2)||(player==1&&cpu==0)||(player==2&&cpu==1);setState(()=>message='أنت: '+choices[player]+' • الحاسوب: '+choices[cpu]+' • '+(player==cpu?'تعادل':win?'فوزك':'فوز الحاسوب'));}
  @override Widget build(BuildContext context)=>Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text(message,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w800)),
    ...List.generate(3,(i)=>Padding(padding:const EdgeInsets.all(4),child:FilledButton.tonal(onPressed:()=>play(i),child:Text(choices[i])))),
  ]));
}

class SudokuGame extends StatefulWidget{const SudokuGame({super.key});@override State<SudokuGame>createState()=>_SudokuState();}
class _SudokuState extends State<SudokuGame>{
  final boards=const[
    '1 2 | 3 _\n3 _ | 1 2\n_ 3 | _ 4\n4 _ | 2 1',
    '2 _ | 4 1\n4 1 | _ 3\n_ 3 | 1 _\n1 4 | 2 _',
    '3 4 | _ 2\n_ 2 | 1 4\n4 _ | 2 _\n2 1 | _ 3',
    '4 _ | 2 3\n2 3 | 4 _\n_ 4 | 3 1\n3 1 | _ 4',
  ];
  int index=0;
  void next()=>setState(()=>index=(index+1)%boards.length);
  @override Widget build(BuildContext context)=>Center(child:Padding(padding:const EdgeInsets.all(25),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('سودوكو 4×4 • لوحة '+(index+1).toString(),style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:16),
    Text(boards[index],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:26)),const SizedBox(height:18),FilledButton(onPressed:next,child:const Text('لوحة جديدة')),
  ])));
}

class CheckersGame extends StatefulWidget{const CheckersGame({super.key});@override State<CheckersGame>createState()=>_CheckersState();}
class _CheckersState extends State<CheckersGame>{
  int selected=-1,turn=0;final pieces=<int>[0,2,5,7,8,10,13,15,16,18,21,23];
  void tap(int i){if(((i~/8+i%8)%2)==0)return;setState((){selected=i;turn++;});}
  @override Widget build(BuildContext context)=>Column(children:[
    Expanded(child:GridView.builder(padding:const EdgeInsets.all(16),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:8),itemCount:64,itemBuilder:(_,i){
      final dark=((i~/8+i%8)%2)==1,piece=pieces.contains(i),picked=i==selected;
      return InkWell(onTap:dark?()=>tap(i):null,child:Container(color:dark?const Color(0xFF333333):const Color(0xFF111111),child:Center(child:Text(piece?'●':picked?'◆':'',style:const TextStyle(color:Colors.white,fontSize:28)))));
    })),Text(selected<0?'اختر خانة للعب':'الحركة '+turn.toString(),style:const TextStyle(color:Colors.white)),
  ]);
}

class RunnerGame extends StatefulWidget{const RunnerGame({super.key});@override State<RunnerGame>createState()=>_RunnerState();}
class _RunnerState extends State<RunnerGame>{
  int lane=1,score=0,obstacle=0;Timer?timer;final random=Random();
  @override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:650),(_){if(mounted)setState((){score++;obstacle=random.nextInt(3);});});}
  @override void dispose(){timer?.cancel();super.dispose();}
  @override Widget build(BuildContext context)=>Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('النقاط: $score',style:const TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w900)),const SizedBox(height:20),
    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:List.generate(3,(i)=>GestureDetector(onTap:()=>setState(()=>lane=i),child:Container(width:70,height:180,color:const Color(0xFF222222),child:Center(child:Text(i==obstacle?'×':i==lane?'●':'',style:const TextStyle(color:Colors.white,fontSize:38))))))),
  ]);
}

class MazeGame extends StatefulWidget{const MazeGame({super.key});@override State<MazeGame>createState()=>_MazeState();}
class _MazeState extends State<MazeGame>{
  Point<int>p=const Point(0,0);
  final layouts=<Set<Point<int>>>[
    {Point(1,0),Point(1,1),Point(3,2),Point(3,3)},
    {Point(2,0),Point(2,1),Point(1,3),Point(3,3)},
    {Point(1,1),Point(1,2),Point(3,1),Point(3,2)},
  ];
  int level=0;late Set<Point<int>>block;
  @override void initState(){super.initState();block=layouts[0];}
  void move(int dx,int dy){final n=Point(p.x+dx,p.y+dy);if(n.x<0||n.y<0||n.x>4||n.y>4||block.contains(n))return;setState((){p=n;if(p==const Point(4,4)){level=(level+1)%layouts.length;p=const Point(0,0);block=layouts[level];}});}
  @override Widget build(BuildContext context)=>Column(children:[
    Expanded(child:GridView.builder(padding:const EdgeInsets.all(30),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:5,crossAxisSpacing:4,mainAxisSpacing:4),itemCount:25,itemBuilder:(_,i){final q=Point(i%5,i~/5);return Container(color:block.contains(q)?const Color(0xFF333333):const Color(0xFF111111),child:Center(child:Text(q==p?'●':q==const Point(4,4)?'★':'',style:const TextStyle(color:Colors.white,fontSize:24))));})),
    Text('المتاهة '+(level+1).toString()+' • أوصل النقطة إلى النجمة',style:const TextStyle(color:Colors.white)),
    Wrap(children:[IconButton(onPressed:()=>move(0,-1),icon:const Icon(Icons.keyboard_arrow_up)),IconButton(onPressed:()=>move(-1,0),icon:const Icon(Icons.keyboard_arrow_left)),IconButton(onPressed:()=>move(1,0),icon:const Icon(Icons.keyboard_arrow_right)),IconButton(onPressed:()=>move(0,1),icon:const Icon(Icons.keyboard_arrow_down))]),
  ]);
}

class ChallengeGame extends StatefulWidget{const ChallengeGame({super.key});@override State<ChallengeGame>createState()=>_ChallengeState();}
class _ChallengeState extends State<ChallengeGame>{
  final random=Random();final tasks=const['اكتب خمس كلمات بحرف واحد','اذكر ثلاث فوائد للمشي','رتب خمسة أرقام تصاعديًا','صف شيئًا دون ذكر اسمه','اخترع اسمًا لمدينة خيالية','اكتب سؤالًا طريفًا','اذكر أربعة أشياء حولك'];String task='اضغط للحصول على تحدٍ جديد';final used=<int>{};
  void next(){if(used.length==tasks.length)used.clear();int i;do{i=random.nextInt(tasks.length);}while(used.contains(i));used.add(i);setState(()=>task=tasks[i]);}
  @override Widget build(BuildContext context)=>Center(child:Padding(padding:const EdgeInsets.all(25),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('التحدي العشوائي',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:18),Text(task,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:23)),const SizedBox(height:22),FilledButton(onPressed:next,child:const Text('تحدٍ جديد')),
  ])));
}
class MysteryGame extends StatefulWidget{const MysteryGame({super.key});@override State<MysteryGame>createState()=>_MysteryState();}
class _MysteryState extends State<MysteryGame>{
  final cases=const[
    ['رسالة غامضة ظهرت عند منتصف الليل.','افحص الختم','قارن التوقيت'],
    ['صندوق مجهول وصل بلا اسم مرسل.','افحص القفل','راجع الطريق'],
    ['صوت خافت سُمع في مبنى فارغ.','تتبع الصوت','ابحث عن مصدر الطاقة'],
    ['رمز غريب ظهر على شاشة قديمة.','حل الرمز','ابحث عن المفتاح'],
  ];
  int index=0;
  void next()=>setState(()=>index=(index+1)%cases.length);
  @override Widget build(BuildContext context){final x=cases[index];return Center(child:Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('الغموض رقم '+(index+1).toString(),style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:12),Text(x[0],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:21)),const SizedBox(height:22),
    FilledButton(onPressed:next,child:Text(x[1])),const SizedBox(height:10),FilledButton.tonal(onPressed:next,child:Text(x[2])),
  ])));}}

class FakeTerminalGame extends StatefulWidget{
  const FakeTerminalGame({super.key});
  @override State<FakeTerminalGame> createState()=>_TerminalState();
}
class _TerminalState extends State<FakeTerminalGame>{
  final controller=TextEditingController();
  final List<String>lines=['محطة هيوكا الوهمية','الوضع التجريبي جاهز'];
  void runCommand(){final command=controller.text.trim();if(command.isEmpty)return;setState((){lines.add('> '+command);lines.add('تم تنفيذ الأمر داخل المحاكاة فقط');controller.clear();});}
  @override void dispose(){controller.dispose();super.dispose();}
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(14),child:Column(children:[
    Expanded(child:Container(color:const Color(0xFF080808),padding:const EdgeInsets.all(12),child:ListView(children:lines.map((x)=>Text(x,style:const TextStyle(color:Colors.white,fontFamily:'monospace'))).toList()))),
    Row(children:[Expanded(child:TextField(controller:controller)),IconButton(onPressed:runCommand,icon:const Icon(Icons.send))]),
  ]));
}

class EscapeGame extends StatefulWidget{
  const EscapeGame({super.key});
  @override State<EscapeGame>createState()=>_EscapeState();
}
class _EscapeState extends State<EscapeGame>{
  final controller=TextEditingController();
  final codes=const['3142','5821','7604','1935','4278'];int index=0;String message='اكتشف الرمز';
  @override void dispose(){controller.dispose();super.dispose();}
  void unlock(){final ok=controller.text.trim()==codes[index];setState((){if(ok){index=(index+1)%codes.length;controller.clear();message='تم الفتح، رمز جديد';}else{message='رمز غير صحيح';}});}
  @override Widget build(BuildContext context)=>Center(child:Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    const Icon(Icons.lock,size:70,color:Colors.white),const Text('غرفة الهروب',style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w900)),Text(message,style:const TextStyle(color:Colors.white)),
    Text('الجولة '+(index+1).toString(),style:const TextStyle(color:Colors.white)),TextField(controller:controller,keyboardType:TextInputType.number,textDirection:TextDirection.ltr),FilledButton(onPressed:unlock,child:const Text('فتح')),
  ])));
}


class BossGame extends StatefulWidget{
  const BossGame({super.key});
  @override State<BossGame> createState()=>_BossState();
}
class _BossState extends State<BossGame>{
  final used=<String>{};
  var serial=0;
  late Q current;
  int hp=100,defeated=0,questionNumber=1;
  int? picked;
  Q _nextUnique(){
    for(var attempt=0;attempt<1000;attempt++){
      final q=generateTriviaQuestion(serial++);
      if(used.add(q.key))return q;
    }
    throw StateError('تعذر توليد سؤال زعيم فريد');
  }
  @override void initState(){super.initState();current=_nextUnique();}
  void hit(int answer){if(picked!=null)return;setState(()=>picked=answer);}
  void next(){
    final damage=picked==current.answer?25:8;
    setState((){
      hp=max(0,hp-damage);
      if(hp==0){defeated++;hp=100;}
      current=_nextUnique();
      picked=null;
      questionNumber++;
    });
  }
  @override Widget build(BuildContext context)=>Padding(padding:const EdgeInsets.all(20),child:Column(children:[
    Text('طاقة الزعيم: ' + _arNumber(hp),style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
    Text('الزعماء المهزومون: ' + _arNumber(defeated) + ' • السؤال ' + _arNumber(questionNumber),style:const TextStyle(color:Colors.white)),
    const SizedBox(height:14),
    Text(current.text,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:22)),
    const Spacer(),
    ...List.generate(current.options.length,(i)=>Padding(padding:const EdgeInsets.only(bottom:8),child:FilledButton.tonal(onPressed:picked==null?()=>hit(i):null,child:Text(current.options[i])))),
    const Spacer(),
    if(picked!=null)Text(picked==current.answer?'ضربة قوية':'ضربة ضعيفة',style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
    const SizedBox(height:10),
    FilledButton(onPressed:picked==null?null:next,child:const Text('استمرار')),
  ]));
}

