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
      case 'terminal': return const FakeTerminalGame();
      case 'escape': return const EscapeGame();
      case 'boss': return const BossGame();
      default: return Center(child: Text(title));
    }
  }
}

class Q { final String text; final List<String> options; final int answer; const Q(this.text,this.options,this.answer); }
const trivia=[
Q('ما لغة برمجة فلاتر؟',['دارت','كوتلن','سويفت','جافا'],0),
Q('ماذا تعني وحدة معالجة الرسومات؟',['وحدة طاقة الألعاب','وحدة معالجة الرسومات','أداة البرامج العامة','مستخدم البكسل'],1),
Q('كم بت في البايت الواحد؟',['أربعة','ثمانية','ستة عشر','اثنان وثلاثون'],1),
Q('ما أكبر محيط على الأرض؟',['الأطلسي','الهندي','الهادئ','المتجمد الشمالي'],2),
Q('ما ناتج 12 × 8؟',['86','96','108','118'],1),
Q('كم عدد الكواكب في النظام الشمسي؟',['سبعة','ثمانية','تسعة','عشرة'],1),
Q('ما الغاز الأكثر وفرة في الغلاف الجوي؟',['الأكسجين','النيتروجين','الهيدروجين','ثاني أكسيد الكربون'],1),
Q('ما العملية التي تحول الماء إلى بخار؟',['التجمد','التبخر','التكاثف','الترسيب'],1),
];
const anime=[
Q('من صاحب القبعة القشية؟',['لوفي','ليفاي','لايت','تانجيرو'],0),
Q('أي عمل يرتبط بدفتر قاتل؟',['بليتش','مذكرة الموت','هايكيو','د. ستون'],1),
Q('أي قرية ينتمي إليها ناروتو؟',['الورق المخفي','الضباب المخفي','الرمال المخفية','السحب المخفية'],0),
Q('من بطل قاتل الشياطين؟',['تانجيرو','لوفي','باكوجو','غوجو'],0),
Q('من يستخدم قوة العمالقة في هجوم العمالقة؟',['إيرين','زينيتسو','كاكاشي','غون'],0),
];
const who=[
Q('شخصية صفراء كهربائية ومحبوبة؟',['بيكاتشو','سونيك','كيربي','ماريو'],0),
Q('يريد أن يصبح هوكاجي؟',['ناروتو','غوكو','لوفي','سايتاما'],0),
Q('قنفذ أزرق سريع جدًا؟',['سونيك','لينك','ماريو','كيربي'],0),
Q('بطل يستخدم سيفًا أسود في عالم صائدي الشياطين؟',['تانجيرو','إدوارد','غون','غوكو'],0),
Q('شخصية تنتمي إلى عالم السوبر ماريو؟',['ماريو','غوجو','إيرين','ليفاي'],0),
];
const riddles=[
Q('ما الذي له مفاتيح ولا يفتح الأقفال؟',['البيانو','الخريطة','الحذاء','السحابة'],0),
Q('ما الذي يزداد بللًا كلما جفف غيره؟',['المنشفة','الطريق','الهاتف','الظل'],0),
Q('ما الذي له أسنان كثيرة ولا يعض؟',['المشط','القرش','السحاب','القطة'],0),
Q('ما الذي يسمع بلا أذن ويتكلم بلا لسان؟',['الصدى','الكتاب','الريح','الباب'],0),
Q('ما الشيء الذي يزداد كلما شاركته؟',['المعرفة','الظل','الصندوق','المفتاح'],0),
];
const impossible=[
Q('لديك عود ثقاب واحد، ماذا تشعل أولًا؟',['الشمعة','عود الثقاب','المصباح','الغرفة'],1),
Q('ما الذي يمكن كسره دون لمسه؟',['الوعد','الزجاج','الحائط','الهاتف'],0),
Q('ما الذي يسافر حول العالم وهو في زاوية؟',['الطابع','السيارة','السحابة','الساعة'],0),
Q('ما الشيء الذي كلما أخذت منه كبر؟',['الحفرة','الصندوق','الطريق','الباب'],0),
Q('رجل خرج تحت المطر ولم يبتل شعره، لماذا؟',['كان أصلعًا','كان داخل سيارة','كان في البيت','لم تمطر'],0),
];

class EndlessQuizGame extends StatefulWidget {
  final String title;
  final List<Q> questions;
  const EndlessQuizGame({super.key, required this.title, required this.questions});
  @override State<EndlessQuizGame> createState()=>_EndlessQuizState();
}
class _EndlessQuizState extends State<EndlessQuizGame> {
  final Random random=Random();
  late List<Q> deck;
  int index=0,score=0,round=1;
  int? picked;
  String? lastQuestion;
  @override void initState(){super.initState();_newDeck();}
  void _newDeck(){
    deck=List<Q>.from(widget.questions)..shuffle(random);
    if(lastQuestion!=null&&deck.length>1&&deck.first.text==lastQuestion){
      final i=deck.indexWhere((q)=>q.text!=lastQuestion);
      final t=deck[0];deck[0]=deck[i];deck[i]=t;
    }
    index=0;
  }
  void next(){
    lastQuestion=deck[index].text;
    setState((){
      if(index==deck.length-1){round++;_newDeck();}else{index++;}
      picked=null;
    });
  }
  @override Widget build(BuildContext context){
    final q=deck[index];
    return Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
      Text(widget.title+' • الجولة '+round.toString()+' • السؤال '+(index+1).toString()+'/'+deck.length.toString(),textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w700)),
      const SizedBox(height:14),
      Text(q.text,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
      const SizedBox(height:16),
      ...List.generate(q.options.length,(n)=>Padding(padding:const EdgeInsets.only(bottom:9),child:FilledButton.tonal(
        onPressed:picked==null?(){setState((){picked=n;if(n==q.answer)score++;});}:null,child:Text(q.options[n],textAlign:TextAlign.center)))),
      const Spacer(),
      if(picked!=null)Text(picked==q.answer?'إجابة صحيحة':'إجابة غير صحيحة',textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
      const SizedBox(height:10),Text('النقاط: '+score.toString(),textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),
      const SizedBox(height:8),FilledButton(onPressed:picked==null?null:next,child:const Text('السؤال التالي')),
    ]));
  }
}
class TriviaGame extends StatelessWidget{const TriviaGame({super.key});@override Widget build(BuildContext c)=>const EndlessQuizGame(title:'المسابقة المتنوعة',questions:trivia);}
class WhoGame extends StatelessWidget{const WhoGame({super.key});@override Widget build(BuildContext c)=>const EndlessQuizGame(title:'من أنا؟',questions:who);}
class RiddleGame extends StatelessWidget{const RiddleGame({super.key});@override Widget build(BuildContext c)=>const EndlessQuizGame(title:'الألغاز',questions:riddles);}
class AnimeGame extends StatelessWidget{const AnimeGame({super.key});@override Widget build(BuildContext c)=>const EndlessQuizGame(title:'مسابقة الأنمي',questions:anime);}
class ImpossibleGame extends StatelessWidget{const ImpossibleGame({super.key});@override Widget build(BuildContext c)=>const EndlessQuizGame(title:'المسابقة الخادعة',questions:impossible);}

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
class ClueGame extends StatefulWidget {
  const ClueGame({super.key});
  @override State<ClueGame> createState()=>_ClueState();
}
class _ClueState extends State<ClueGame>{
  final sets=const[
    ['شخصية ألعاب معروفة','ترتبط باللون الأحمر','تظهر في ألعاب المنصات','لها أخ مشهور','اسمها يبدأ بحرف الميم'],
    ['شخصية مقاتلة','تستخدم سيفًا','تظهر في عالم خيالي','لها خصم قوي','تشتهر بالانضباط'],
    ['شخصية سريعة','تتحرك في عالم ملون','تجمع عناصر أثناء اللعب','لها أصدقاء كثيرون','تعتمد على السرعة'],
  ];
  int setIndex=0,clue=0;
  @override Widget build(BuildContext context){final x=sets[setIndex],done=clue==x.length;return Center(child:Padding(padding:const EdgeInsets.all(24),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text(done?'الشخصية الحالية: ماريو':'الدليل '+(clue+1).toString()+'/'+x.length.toString(),style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900),textAlign:TextAlign.center),
    const SizedBox(height:16),Text(done?'ابدأ مجموعة مختلفة':'الدليل الحالي: '+x[clue],textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),
    const SizedBox(height:22),FilledButton(onPressed:()=>setState((){if(done){setIndex=(setIndex+1)%sets.length;clue=0;}else{clue++;}}),child:Text(done?'جولة جديدة':'الدليل التالي')),
  ])));}}
class RatherGame extends StatefulWidget {
  const RatherGame({super.key});
  @override State<RatherGame> createState()=>_RatherState();
}
class _RatherState extends State<RatherGame>{
  final choices=const[
    ['تعيش يومًا كاملًا بلا هاتف','تعيش يومًا كاملًا بلا ألعاب'],['تملك ذاكرة مثالية','تملك تركيزًا مثاليًا'],
    ['تتحرك بسرعة خارقة','تستطيع الاختفاء'],['تختار بابًا سحريًا','تختار خريطة كنوز'],
    ['تتعلم آلة جديدة فورًا','تتعلم لغة جديدة فورًا'],['تستكشف الفضاء','تستكشف أعماق المحيط'],
  ];
  int index=0;
  @override Widget build(BuildContext context){final pair=choices[index];return Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    Text('الجولة '+(index+1).toString(),style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),const SizedBox(height:12),
    const Text('ماذا تفضل؟',style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w900)),const SizedBox(height:22),
    ...pair.map((x)=>Padding(padding:const EdgeInsets.only(bottom:10),child:SizedBox(width:double.infinity,child:FilledButton.tonal(onPressed:()=>setState(()=>index=(index+1)%choices.length),child:Text(x,textAlign:TextAlign.center))))),
    const Text('اختر أحد الخيارين',style:TextStyle(color:Colors.white)),
  ]));}}
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
  final random=Random();late List<Q> deck;Timer?timer;
  int sec=30,score=0,combo=0,index=0;int?picked;
  @override void initState(){super.initState();deck=List<Q>.from(trivia)..shuffle(random);timer=Timer.periodic(const Duration(seconds:1),tick);}
  @override void dispose(){timer?.cancel();super.dispose();}
  void tick(){if(!mounted)return;setState((){sec--;if(sec<=0){sec=30;index=(index+1)%deck.length;picked=null;combo=0;}});}
  void answer(int n){final q=deck[index];setState((){picked=n;if(n==q.answer){combo++;score+=10+combo;}else{combo=0;}});}
  void next(){setState((){index=(index+1)%deck.length;picked=null;sec=30;});}
  @override Widget build(BuildContext context){final q=deck[index];return Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('الوقت $sec'),Text('السلسلة $combo'),Text('النقاط $score')]),
    const SizedBox(height:18),Text(q.text,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900)),
    const SizedBox(height:12),...List.generate(q.options.length,(n)=>Padding(padding:const EdgeInsets.only(bottom:8),child:FilledButton.tonal(onPressed:picked==null?()=>answer(n):null,child:Text(q.options[n])))),
    const Spacer(),if(picked!=null)Text(picked==q.answer?'إجابة صحيحة':'إجابة غير صحيحة',textAlign:TextAlign.center,style:const TextStyle(color:Colors.white)),
    const SizedBox(height:10),FilledButton(onPressed:picked==null?null:next,child:const Text('التالي')),
  ]));}
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
  final layouts=const[
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
  int hp=100,index=0,defeated=0;
  final questions=const[
    Q('ما الكوكب الأقرب إلى الشمس؟',['عطارد','المريخ','المشتري','الأرض'],0),
    Q('كم ضلعًا للمثلث؟',['ثلاثة','أربعة','خمسة','ستة'],0),
    Q('ما أسرع حيوان بري؟',['الفهد','الحصان','الذئب','النمر'],0),
    Q('ما عاصمة مصر؟',['القاهرة','الإسكندرية','الأقصر','أسوان'],0),
    Q('كم دقيقة في الساعة؟',['ستون','خمسون','أربعون','سبعون'],0),
  ];
  void hit(int answer){final q=questions[index];setState((){hp=max(0,hp-(answer==q.answer?25:8));if(hp==0){defeated++;index=(index+1)%questions.length;hp=100;}});}
  @override Widget build(BuildContext context){final q=questions[index];return Padding(padding:const EdgeInsets.all(20),child:Column(children:[
    Text('طاقة الزعيم: '+hp.toString(),style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
    Text('الزعماء المهزومون: '+defeated.toString(),style:const TextStyle(color:Colors.white)),const SizedBox(height:14),
    Text(q.text,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:22)),const Spacer(),
    ...List.generate(q.options.length,(i)=>Padding(padding:const EdgeInsets.only(bottom:8),child:FilledButton.tonal(onPressed:()=>hit(i),child:Text(q.options[i])))),
  ]));}
}
