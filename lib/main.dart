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
  Game('20q','20 Questions','نعم أو لا','Play Here',Icons.help_outline),
  Game('character','Guess the Character','clues تدريجية','Play Here',Icons.person_search),
  Game('rather','Would You Rather','اختيارات','Play Here',Icons.compare_arrows),
  Game('trivia','Trivia','Anime • Games • Android • Science','Play Here',Icons.quiz),
  Game('who','Who Am I?','خمن الشخصية','Play Here',Icons.badge),
  Game('riddle','Riddles','ألغاز','Play Here',Icons.lightbulb_outline),
  Game('word','Word Chain','سلسلة كلمات','Play Here',Icons.link),
  Game('impostor','Impostor Game','واحد مختلف','Play Here',Icons.visibility_off),
  Game('text','Text Adventure','اختيارات وقصة','Play Here',Icons.map),
  Game('detective','Detective Mystery','قضية وأدلة','Play Here',Icons.search),
  Game('battle','Battle Quiz','score + combo + timer','Play Here',Icons.local_fire_department),
  Game('memory','Memory Game','احفظ sequence','Play Here',Icons.psychology),
  Game('snake','Snake','arcade','Arcade',Icons.grid_4x4),
  Game('2048','2048','merge tiles','Arcade',Icons.grid_view),
  Game('tetris','Tetris','falling blocks','Arcade',Icons.view_module),
  Game('mines','Minesweeper','safe cells','Arcade',Icons.warning_amber),
  Game('pong','Pong','move the paddle','Arcade',Icons.sports_tennis),
  Game('flappy','Flappy Hop','avoid pipes','Arcade',Icons.flight),
  Game('reaction','Reaction Test','reflex speed','Arcade',Icons.flash_on),
  Game('typing','Typing Speed Test','speed + accuracy','Arcade',Icons.keyboard),
  Game('clicker','Clicker Game','tap score','Arcade',Icons.touch_app),
  Game('number','Number Guessing','guess 1-100','Arcade',Icons.numbers),
  Game('rps','Rock Paper Scissors','vs computer','Arcade',Icons.back_hand),
  Game('sudoku','Sudoku','4x4 mini','Arcade',Icons.apps),
  Game('checkers','Checkers','simple board','Arcade',Icons.circle),
  Game('runner','Endless Runner','switch lanes','Arcade',Icons.directions_run),
  Game('maze','Maze Game','reach the goal','Arcade',Icons.route),
  Game('dungeon','AI Dungeon','branching story','Weird',Icons.auto_awesome),
  Game('mystery','Mystery Generator','new case','Weird',Icons.shuffle),
  Game('challenge','Random Challenge','random prompt','Weird',Icons.casino),
  Game('anime','Anime Character Quiz','anime trivia','Weird',Icons.movie_filter),
  Game('impossible','Impossible Quiz','trick questions','Weird',Icons.report_problem),
  Game('terminal','Fake Hacker Terminal','fictional only','Weird',Icons.terminal),
  Game('escape','Escape Room','unlock the room','Weird',Icons.lock_open),
  Game('boss','Boss Battle Quiz','questions vs boss','Weird',Icons.shield),
];

class HyoukaFunHub extends StatelessWidget {
  const HyoukaFunHub({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Hyouka Fun Hub',
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white, secondary: Colors.white, surface: Color(0xFF111111),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black, foregroundColor: Colors.white, elevation: 0),
    ),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String filter = 'All', search = '';
  @override
  Widget build(BuildContext context) {
    final items = games.where((g) {
      final okCat = filter == 'All' || g.category == filter;
      final q = search.toLowerCase().trim();
      return okCat && (q.isEmpty || g.title.toLowerCase().contains(q) || g.subtitle.toLowerCase().contains(q));
    }).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Hyouka Fun Hub', style: TextStyle(fontWeight: FontWeight.w900))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,8,16,12),
          child: TextField(onChanged: (v)=>setState(()=>search=v), decoration: const InputDecoration(
            filled: true, fillColor: Color(0xFF111111), prefixIcon: Icon(Icons.search), hintText: 'دور على لعبة...'
          )),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left:16,right:16,bottom:12),
          child: Row(children: ['All','Play Here','Arcade','Weird'].map((c)=>Padding(
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
                  Text(g.subtitle,maxLines:2,overflow:TextOverflow.ellipsis,style:const TextStyle(color:Colors.white70,fontSize:12)),
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
      case 'trivia': return const QuizGame(title:'Trivia',questions:trivia);
      case 'who': return const QuizGame(title:'Who Am I?',questions:who);
      case 'riddle': return const QuizGame(title:'Riddles',questions:riddles);
      case 'word': return const WordGame();
      case 'impostor': return const ImpostorGame();
      case 'text': case 'dungeon': return const StoryGame();
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
      case 'challenge': case 'mystery': return const RandomFunGame();
      case 'anime': return const QuizGame(title:'Anime Character Quiz',questions:anime);
      case 'impossible': return const QuizGame(title:'Impossible Quiz',questions:impossible);
      case 'terminal': return const FakeTerminalGame();
      case 'escape': return const EscapeGame();
      case 'boss': return const BossGame();
      default: return Center(child: Text(title));
    }
  }
}

class Q { final String text; final List<String> options; final int answer; const Q(this.text,this.options,this.answer); }
const trivia=[
  Q('Flutter uses which language?',['Dart','Kotlin','Swift','Java'],0),
  Q('GPU stands for?',['Game Power Unit','Graphics Processing Unit','General Program Utility','Graphic Pixel User'],1),
  Q('One byte contains how many bits?',['4','8','16','32'],1),
  Q('Largest ocean?',['Atlantic','Indian','Pacific','Arctic'],2),
  Q('12 × 8 = ?',['86','96','108','118'],1),
];
const anime=[
  Q('Who wears a straw hat?',['Luffy','Levi','Light','Tanjiro'],0),
  Q('Which series has a deadly notebook?',['Bleach','Death Note','Haikyuu!!','Dr. Stone'],1),
  Q('Naruto is linked to which village?',['Hidden Leaf','Hidden Mist','Hidden Sand','Hidden Cloud'],0),
  Q('Tanjiro is from?',['Demon Slayer','One Piece','Blue Lock','Mob Psycho 100'],0),
];
const who=[
  Q('Yellow and electric?',['Pikachu','Sonic','Kirby','Mario'],0),
  Q('Wants to become Hokage?',['Naruto','Goku','Luffy','Saitama'],0),
  Q('Blue speed-loving hedgehog?',['Sonic','Link','Mario','Kirby'],0),
];
const riddles=[
  Q('What has keys but cannot open locks?',['A piano','A map','A shoe','A cloud'],0),
  Q('What gets wetter while drying?',['A towel','A road','A phone','A shadow'],0),
  Q('What has many teeth but cannot bite?',['A comb','A shark','A zipper','A cat'],0),
];
const impossible=[
  Q('You have one match. What do you light first?',['Candle','The match','Lamp','Room'],1),
  Q('What can be broken without being touched?',['A promise','A glass','A wall','A phone'],0),
  Q('What travels around the world from one corner?',['A stamp','A car','A cloud','A clock'],0),
];

class QuizGame extends StatefulWidget {
  final String title; final List<Q> questions;
  const QuizGame({super.key,required this.title,required this.questions});
  @override State<QuizGame> createState()=>_QuizState();
}
class _QuizState extends State<QuizGame>{
  int index=0,score=0; int? picked;
  void next(){
    if(index==widget.questions.length-1){
      showDialog(context:context,builder:(_)=>AlertDialog(
        title:const Text('خلصت'),content:Text('Score: '+score.toString()+'/'+widget.questions.length.toString()),
        actions:[TextButton(onPressed:(){Navigator.pop(context);setState((){index=0;score=0;picked=null;});},child:const Text('Replay')),TextButton(onPressed:()=>Navigator.pop(context),child:const Text('OK'))],
      ));
    }else setState((){index++;picked=null;});
  }
  @override Widget build(BuildContext context){
    final q=widget.questions[index];
    return Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
      LinearProgressIndicator(value:(index+1)/widget.questions.length),const SizedBox(height:20),
      Text(q.text,style:const TextStyle(fontSize:25,fontWeight:FontWeight.w900)),const SizedBox(height:16),
      ...List.generate(q.options.length,(n)=>Padding(padding:const EdgeInsets.only(bottom:9),child:FilledButton.tonal(
        onPressed:picked==null?(){setState((){picked=n;if(n==q.answer)score++;});}:null,child:Align(alignment:Alignment.centerLeft,child:Text(q.options[n]))
      ))),
      const Spacer(),if(picked!=null)Text(picked==q.answer?'Correct':'Wrong',textAlign:TextAlign.center),
      const SizedBox(height:10),FilledButton(onPressed:picked==null?null:next,child:const Text('Next')),
    ]));
  }
}

class TwentyQ extends StatefulWidget{const TwentyQ({super.key});@override State<TwentyQ>createState()=>_TwentyQState();}
class _TwentyQState extends State<TwentyQ>{int i=0;final q=const['هل هي حية؟','هل تقدر تمسكها؟','هل تستخدمها كتير؟','هل فيها تكنولوجيا؟','هل تحتاج كهرباء؟','هل للترفيه؟','هل تخزن بيانات؟','هل في جيبك؟'];@override Widget build(BuildContext c)=>Center(child:Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(i>=q.length?'تخميني: الموبايل':'Question '+(i+1).toString()+'/20',style:const TextStyle(fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:16),Text(i>=q.length?'دي جولة تجريبية':'أجب بنعم أو لا',textAlign:TextAlign.center),if(i<q.length) ...[const SizedBox(height:20),Row(children:[Expanded(child:FilledButton(onPressed:()=>setState(()=>i++),child:const Text('Yes'))),const SizedBox(width:10),Expanded(child:FilledButton.tonal(onPressed:()=>setState(()=>i++),child:const Text('No')))])]else FilledButton(onPressed:()=>setState(()=>i=0),child:const Text('Again'))])));}

class ClueGame extends StatefulWidget{const ClueGame({super.key});@override State<ClueGame>createState()=>_ClueState();}
class _ClueState extends State<ClueGame>{int i=0;final clues=const['شخصية ألعاب','مرتبطة بالأحمر','بتظهر في المنصات','عندها أخ مشهور'];@override Widget build(BuildContext c)=>Center(child:Padding(padding:const EdgeInsets.all(24),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(i==clues.length?'Mario!':'Clue '+(i+1).toString(),style:const TextStyle(fontSize:32,fontWeight:FontWeight.w900)),const SizedBox(height:14),Text(i==clues.length?'Guess before the final clue':'افتح clue تدريجيًا',textAlign:TextAlign.center),const SizedBox(height:22),FilledButton(onPressed:()=>setState(()=>i=i==clues.length?0:i+1),child:Text(i==clues.length?'Replay':'Next Clue'))])));}

class RatherGame extends StatefulWidget{const RatherGame({super.key});@override State<RatherGame>createState()=>_RatherState();}
class _RatherState extends State<RatherGame>{int i=0;final p=const[['عالم أنمي','عالم ألعاب'],['ذاكرة مثالية','تركيز مثالي'],['سرعة خارقة','اختفاء']];@override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text('Round '+(i+1).toString(),style:const TextStyle(color:Colors.white60)),const SizedBox(height:12),const Text('Would You Rather?',style:TextStyle(fontSize:30,fontWeight:FontWeight.w900)),const SizedBox(height:20),...p[i].map((x)=>Padding(padding:const EdgeInsets.only(bottom:10),child:SizedBox(width:double.infinity,child:FilledButton.tonal(onPressed:()=>setState(()=>i=(i+1)%p.length),child:Text(x)))))]));}

class WordGame extends StatefulWidget{const WordGame({super.key});@override State<WordGame>createState()=>_WordState();}
class _WordState extends State<WordGame>{final c=TextEditingController();final words=<String>[];String msg='ابدأ بأي كلمة إنجليزية';@override void dispose(){c.dispose();super.dispose();}void add(){final w=c.text.trim().toLowerCase();if(w.length<2){setState(()=>msg='كلمة أطول');return;}if(words.contains(w)){setState(()=>msg='استخدم كلمة جديدة');return;}if(words.isNotEmpty&&w[0]!=words.last[words.last.length-1]){setState(()=>msg='ابدأ بحرف '+words.last[words.last.length-1].toUpperCase());return;}setState((){words.add(w);c.clear();msg='التالي يبدأ بـ '+w[w.length-1].toUpperCase();});}@override Widget build(BuildContext cxt)=>Padding(padding:const EdgeInsets.all(18),child:Column(children:[Text('Score: '+words.length.toString(),style:const TextStyle(fontSize:24,fontWeight:FontWeight.w900)),Text(msg),const SizedBox(height:10),TextField(controller:c),FilledButton(onPressed:add,child:const Text('Play Word')),Expanded(child:ListView(children:words.reversed.map((x)=>ListTile(title:Text(x))).toList()))]));}

class ImpostorGame extends StatefulWidget{const ImpostorGame({super.key});@override State<ImpostorGame>createState()=>_ImpostorState();}
class _ImpostorState extends State<ImpostorGame>{final r=Random();int player=0,odd=0;bool reveal=false;@override void initState(){super.initState();odd=r.nextInt(4);}@override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.all(20),child:Column(children:[Text('Player '+(player+1).toString(),style:const TextStyle(fontSize:30,fontWeight:FontWeight.w900)),const Spacer(),GestureDetector(onTap:()=>setState(()=>reveal=!reveal),child:Card(color:const Color(0xFF111111),child:Padding(padding:const EdgeInsets.all(35),child:Text(reveal?(player==odd?'SUBMARINE':'SPACE STATION'):'Tap to reveal',style:const TextStyle(fontSize:24,fontWeight:FontWeight.w900))))),const Spacer(),FilledButton(onPressed:()=>setState((){if(player==3){player=0;odd=r.nextInt(4);}else player++;reveal=false;}),child:Text(player==3?'New Round':'Next Player'))]));}

class StoryGame extends StatefulWidget{const StoryGame({super.key});@override State<StoryGame>createState()=>_StoryState();}
class _StoryState extends State<StoryGame>{int i=0;final s=const['محطة مهجورة. قدامك نفق وباب حديدي.','داخل النفق خريطة وفتحة صغيرة.','الباب يطلب رمزًا.','لقيت غرفة سرية. نهاية المسار الحالي.'];@override Widget build(BuildContext c)=>Center(child:Padding(padding:const EdgeInsets.all(22),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(s[i],textAlign:TextAlign.center,style:const TextStyle(fontSize:24,fontWeight:FontWeight.w900)),const SizedBox(height:20),FilledButton(onPressed:()=>setState(()=>i=i<3?i+1:0),child:Text(i<3?'Choose path':'Restart'))])));}

class DetectiveGame extends StatefulWidget{const DetectiveGame({super.key});@override State<DetectiveGame>createState()=>_DetectiveState();}
class _DetectiveState extends State<DetectiveGame>{String msg='';void solve(String x)=>setState(()=>msg=x=='Mina'?'صح.':'غلط. راجع التوقيت.');@override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[const Text('Case 07',style:TextStyle(fontSize:28,fontWeight:FontWeight.w900)),const Text('الاختفاء بين 19:10 و19:30. استخدم سجل الرسائل والكاميرا.'),const Spacer(),Text(msg,textAlign:TextAlign.center),...['Alex','Mina','Omar'].map((x)=>Padding(padding:const EdgeInsets.only(bottom:8),child:FilledButton.tonal(onPressed:()=>solve(x),child:Text('Suspect: '+x))))]));}

class BattleGame extends StatefulWidget {
  const BattleGame({super.key});
  @override State<BattleGame> createState() => _BattleState();
}
class _BattleState extends State<BattleGame> {
  int sec = 30, score = 0, combo = 0, index = 0;
  int? picked;
  Timer? timer;

  @override void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => sec = max(0, sec - 1));
    });
  }
  @override void dispose() {
    timer?.cancel();
    super.dispose();
  }
  void answer(int n) {
    final q = trivia[index];
    setState(() {
      picked = n;
      if (n == q.answer) {
        combo++;
        score += 10 + combo;
      } else {
        combo = 0;
      }
    });
  }
  @override Widget build(BuildContext context) {
    final q = trivia[index];
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Time $sec'), Text('Combo x$combo'), Text('Score $score')],
          ),
          const SizedBox(height: 18),
          Text(q.text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          for (int n = 0; n < q.options.length; n++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FilledButton.tonal(
                onPressed: picked != null || sec == 0 ? null : () => answer(n),
                child: Text(q.options[n]),
              ),
            ),
          const Spacer(),
          FilledButton(
            onPressed: picked == null ? null : () {
              setState(() {
                index = (index + 1) % trivia.length;
                picked = null;
              });
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});
  @override State<MemoryGame> createState() => _MemoryState();
}
class _MemoryState extends State<MemoryGame> {
  final Random random = Random();
  List<int> sequence = [];
  List<int> input = [];
  int level = 1;
  bool showing = false;
  String message = 'Start';

  Future<void> startGame() async {
    sequence = List.generate(level + 2, (_) => random.nextInt(4));
    input = [];
    setState(() {
      showing = true;
      message = 'Watch';
    });
    for (final value in sequence) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      setState(() => input = [value]);
      await Future.delayed(const Duration(milliseconds: 250));
      if (!mounted) return;
      setState(() => input = []);
    }
    if (mounted) {
      setState(() {
        showing = false;
        input = [];
        message = 'Repeat';
      });
    }
  }

  void tap(int value) {
    if (showing || sequence.isEmpty) return;
    final i = input.length;
    if (i >= sequence.length || sequence[i] != value) {
      setState(() {
        level = 1;
        sequence = [];
        input = [];
        message = 'Wrong';
      });
      return;
    }
    setState(() {
      input = [...input, value];
      if (input.length == sequence.length) {
        level++;
        sequence = [];
        input = [];
        message = 'Perfect';
      }
    });
  }

  @override Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height: 12),
      Text('Level $level', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
      Text(message),
      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(24),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          children: List.generate(
            4,
            (i) => GestureDetector(
              onTap: () => tap(i),
              child: Container(
                decoration: BoxDecoration(
                  color: input.contains(i) ? Colors.white : const Color(0xFF222222),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
        ),
      ),
      FilledButton(onPressed: showing ? null : startGame, child: const Text('Start')),
    ],
  );
}

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});
  @override State<SnakeGame> createState() => _SnakeState();
}
class _SnakeState extends State<SnakeGame> {
  static const int size = 12;
  final Random random = Random();
  List<Point<int>> snake = const [Point(5, 6), Point(4, 6), Point(3, 6)];
  Point<int> food = const Point(9, 6);
  Point<int> direction = const Point(1, 0);
  Timer? timer;
  bool over = false;

  @override void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 180), (_) => tick());
  }
  @override void dispose() {
    timer?.cancel();
    super.dispose();
  }
  void turn(Point<int> next) {
    if (direction.x + next.x == 0 && direction.y + next.y == 0) return;
    direction = next;
  }
  void tick() {
    if (over || !mounted) return;
    final head = snake.first;
    final next = Point(head.x + direction.x, head.y + direction.y);
    if (next.x < 0 || next.y < 0 || next.x >= size || next.y >= size || snake.contains(next)) {
      setState(() => over = true);
      return;
    }
    final nextSnake = [next, ...snake];
    if (next == food) {
      do {
        food = Point(random.nextInt(size), random.nextInt(size));
      } while (nextSnake.contains(food));
    } else {
      nextSnake.removeLast();
    }
    setState(() => snake = nextSnake);
  }
  void reset() {
    setState(() {
      snake = const [Point(5, 6), Point(4, 6), Point(3, 6)];
      food = Point(random.nextInt(size), random.nextInt(size));
      direction = const Point(1, 0);
      over = false;
    });
  }
  @override Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
              itemCount: size * size,
              itemBuilder: (_, i) {
                final p = Point(i % size, i ~/ size);
                return Container(
                  margin: const EdgeInsets.all(1),
                  color: p == food
                      ? Colors.white
                      : snake.contains(p)
                          ? Colors.white70
                          : const Color(0xFF111111),
                );
              },
            ),
          ),
        ),
      ),
      if (over) const Text('Game Over', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
      Wrap(
        children: [
          IconButton(onPressed: () => turn(const Point(0, -1)), icon: const Icon(Icons.keyboard_arrow_up)),
          IconButton(onPressed: () => turn(const Point(-1, 0)), icon: const Icon(Icons.keyboard_arrow_left)),
          IconButton(onPressed: () => turn(const Point(1, 0)), icon: const Icon(Icons.keyboard_arrow_right)),
          IconButton(onPressed: () => turn(const Point(0, 1)), icon: const Icon(Icons.keyboard_arrow_down)),
          IconButton(onPressed: reset, icon: const Icon(Icons.refresh)),
        ],
      ),
    ],
  );
}

class Game2048 extends StatefulWidget {
  const Game2048({super.key});
  @override State<Game2048> createState() => _Game2048State();
}
class _Game2048State extends State<Game2048> {
  final Random random = Random();
  List<int> board = List.filled(16, 0);
  int score = 0;

  @override void initState() {
    super.initState();
    reset();
  }
  void reset() {
    board = List.filled(16, 0);
    score = 0;
    spawn();
    spawn();
    setState(() {});
  }
  void spawn() {
    final empty = [for (int i = 0; i < 16; i++) if (board[i] == 0) i];
    if (empty.isNotEmpty) board[empty[random.nextInt(empty.length)]] = random.nextInt(10) == 0 ? 4 : 2;
  }
  List<int> merge(List<int> values) {
    final compact = values.where((v) => v != 0).toList();
    final result = <int>[];
    for (int i = 0; i < compact.length; i++) {
      if (i + 1 < compact.length && compact[i] == compact[i + 1]) {
        final value = compact[i] * 2;
        result.add(value);
        score += value;
        i++;
      } else {
        result.add(compact[i]);
      }
    }
    while (result.length < 4) result.add(0);
    return result;
  }
  void move(int direction) {
    final old = List<int>.from(board);
    for (int line = 0; line < 4; line++) {
      var values = direction < 2
          ? [for (int row = 0; row < 4; row++) board[row * 4 + line]]
          : board.sublist(line * 4, line * 4 + 4);
      final reverse = direction == 1 || direction == 3;
      if (reverse) values = values.reversed.toList();
      values = merge(values);
      if (reverse) values = values.reversed.toList();
      if (direction < 2) {
        for (int row = 0; row < 4; row++) board[row * 4 + line] = values[row];
      } else {
        board.replaceRange(line * 4, line * 4 + 4, values);
      }
    }
    if (!_same(old, board)) spawn();
    setState(() {});
  }
  bool _same(List<int> a, List<int> b) {
    for (int i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
    return true;
  }
  @override Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height: 12),
      Text('Score: $score'),
      Expanded(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 6, mainAxisSpacing: 6),
              itemCount: 16,
              itemBuilder: (_, i) => Container(
                color: board[i] == 0 ? const Color(0xFF111111) : Colors.white,
                child: Center(
                  child: Text(
                    board[i] == 0 ? '' : board[i].toString(),
                    style: TextStyle(color: board[i] == 0 ? Colors.white : Colors.black, fontWeight: FontWeight.w900, fontSize: 21),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Wrap(
        children: [
          IconButton(onPressed: () => move(0), icon: const Icon(Icons.keyboard_arrow_up)),
          IconButton(onPressed: () => move(2), icon: const Icon(Icons.keyboard_arrow_left)),
          IconButton(onPressed: () => move(3), icon: const Icon(Icons.keyboard_arrow_right)),
          IconButton(onPressed: () => move(1), icon: const Icon(Icons.keyboard_arrow_down)),
          IconButton(onPressed: reset, icon: const Icon(Icons.refresh)),
        ],
      ),
    ],
  );
}

class TetrisGame extends StatefulWidget {
  const TetrisGame({super.key});
  @override State<TetrisGame> createState() => _TetrisState();
}
class _TetrisState extends State<TetrisGame> {
  static const int columns = 8;
  static const int rows = 16;
  Timer? timer;
  int x = 3, y = 0, score = 0;
  List<int> cells = List.filled(columns * rows, 0);

  @override void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 450), (_) => fall());
  }
  @override void dispose() {
    timer?.cancel();
    super.dispose();
  }
  void fall() {
    if (y < rows - 1) {
      setState(() => y++);
    } else {
      setState(() {
        cells[(rows - 1) * columns + x] = 1;
        y = 0;
        score++;
      });
    }
  }
  void reset() {
    setState(() {
      cells = List.filled(columns * rows, 0);
      x = 3;
      y = 0;
      score = 0;
    });
  }
  @override Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: Center(
          child: AspectRatio(
            aspectRatio: columns / rows,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns),
              itemCount: cells.length,
              itemBuilder: (_, i) {
                final cx = i % columns, cy = i ~/ columns;
                final falling = cx == x && cy == y;
                return Container(
                  margin: const EdgeInsets.all(1),
                  color: falling || cells[i] != 0 ? Colors.white : const Color(0xFF111111),
                );
              },
            ),
          ),
        ),
      ),
      Text('Score: $score'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: () => setState(() => x = max(0, x - 1)), icon: const Icon(Icons.keyboard_arrow_left)),
          IconButton(onPressed: fall, icon: const Icon(Icons.keyboard_arrow_down)),
          IconButton(onPressed: () => setState(() => x = min(columns - 1, x + 1)), icon: const Icon(Icons.keyboard_arrow_right)),
          IconButton(onPressed: reset, icon: const Icon(Icons.refresh)),
        ],
      ),
    ],
  );
}

class MinesGame extends StatefulWidget {
  const MinesGame({super.key});
  @override State<MinesGame> createState() => _MinesState();
}
class _MinesState extends State<MinesGame> {
  final Random random = Random();
  Set<int> mines = {};
  List<bool> opened = List.filled(64, false);
  bool over = false;

  @override void initState() {
    super.initState();
    reset();
  }
  void reset() {
    setState(() {
      mines = {};
      while (mines.length < 10) mines.add(random.nextInt(64));
      opened = List.filled(64, false);
      over = false;
    });
  }
  void tap(int index) {
    if (over || opened[index]) return;
    setState(() {
      opened[index] = true;
      if (mines.contains(index)) over = true;
    });
  }
  @override Widget build(BuildContext context) => Column(
    children: [
      Text(over ? 'Boom' : 'Minesweeper', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
      Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(18),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemCount: 64,
          itemBuilder: (_, i) => InkWell(
            onTap: () => tap(i),
            child: Container(
              color: over && mines.contains(i)
                  ? const Color(0xFF552222)
                  : opened[i]
                      ? Colors.white
                      : const Color(0xFF181818),
              child: Center(
                child: Text(
                  over && mines.contains(i) ? '×' : opened[i] ? '•' : '',
                  style: TextStyle(color: opened[i] && !mines.contains(i) ? Colors.black : Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      FilledButton(onPressed: reset, child: const Text('Reset')),
    ],
  );
}

class PongGame extends StatefulWidget{const PongGame({super.key});@override State<PongGame>createState()=>_PongState();}
class _PongState extends State<PongGame>{double paddle=.5,bx=.5,by=.5,vx=.008,vy=.009;int score=0;Timer?timer;@override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:30),(_){if(!mounted)return;setState((){bx+=vx;by+=vy;if(bx<.02||bx>.98)vx=-vx;if(by<.02)vy=vy.abs();if(by>.92){if((bx-paddle).abs()<.16){vy=-vy.abs();score++;}else{bx=.5;by=.5;}}});});}@override void dispose(){timer?.cancel();super.dispose();}@override Widget build(BuildContext c)=>Column(children:[Text('Score: '+score.toString()),Expanded(child:GestureDetector(onHorizontalDragUpdate:(d)=>setState(()=>paddle=(paddle+d.delta.dx/280).clamp(.12,.88)),child:CustomPaint(painter:PongPainter(bx,by,paddle),child:const SizedBox.expand()))),const Text('اسحب المضرب')]);}
class PongPainter extends CustomPainter{final double x,y,p;PongPainter(this.x,this.y,this.p);@override void paint(Canvas c,Size s){final a=Paint()..color=Colors.white;c.drawCircle(Offset(x*s.width,y*s.height),8,a);c.drawRect(Rect.fromCenter(center:Offset(p*s.width,s.height-22),width:100,height:10),a);}@override bool shouldRepaint(covariant PongPainter old)=>true;}

class FlappyGame extends StatefulWidget{const FlappyGame({super.key});@override State<FlappyGame>createState()=>_FlappyState();}
class _FlappyState extends State<FlappyGame>{double bird=.5,vel=0,pipe=1;int score=0;bool over=false;Timer?timer;@override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:30),(_){if(!mounted||over)return;setState((){vel+=.0017;bird+=vel;pipe-=.006;if(pipe<-.2){pipe=1.1;score++;}if(bird<.02||bird>.98)over=true;});});}@override void dispose(){timer?.cancel();super.dispose();}void flap()=>setState((){if(over){bird=.5;vel=0;pipe=1;score=0;over=false;}else vel=-.028;});@override Widget build(BuildContext c)=>GestureDetector(onTap:flap,child:Stack(children:[Positioned.fill(child:CustomPaint(painter:FlappyPainter(bird,pipe))),Center(child:Text(over?'Tap to Restart':'Score '+score.toString(),style:const TextStyle(fontSize:25,fontWeight:FontWeight.w900)))]));}
class FlappyPainter extends CustomPainter{final double b,p;FlappyPainter(this.b,this.p);@override void paint(Canvas c,Size s){final a=Paint()..color=Colors.white;c.drawCircle(Offset(s.width*.25,s.height*b),13,a);c.drawRect(Rect.fromLTWH(s.width*p,0,50,s.height*.5-130),a);c.drawRect(Rect.fromLTWH(s.width*p,s.height*.5+130,50,s.height),a);}@override bool shouldRepaint(covariant FlappyPainter old)=>true;}

class ReactionGame extends StatefulWidget{const ReactionGame({super.key});@override State<ReactionGame>createState()=>_ReactionState();}
class _ReactionState extends State<ReactionGame>{final r=Random();bool waiting=false,go=false;DateTime?start;Timer?timer;String text='Tap Start';@override void dispose(){timer?.cancel();super.dispose();}void tap(){if(!waiting){setState((){waiting=true;text='Wait...';});timer=Timer(Duration(milliseconds:1000+r.nextInt(1800)),(){if(mounted)setState((){go=true;start=DateTime.now();text='TAP!';});});return;}if(!go){timer?.cancel();setState((){waiting=false;text='Too early';});return;}final ms=DateTime.now().difference(start!).inMilliseconds;setState((){waiting=false;go=false;text=ms.toString()+' ms';});}@override Widget build(BuildContext c)=>GestureDetector(onTap:tap,child:Center(child:Text(text,style:const TextStyle(fontSize:38,fontWeight:FontWeight.w900))));}

class TypingGame extends StatefulWidget{const TypingGame({super.key});@override State<TypingGame>createState()=>_TypingState();}
class _TypingState extends State<TypingGame>{final c=TextEditingController();final prompt='Flutter makes small games fun and fast.';DateTime?start;String msg='Type the sentence';@override void dispose(){c.dispose();super.dispose();}void check(){start??=DateTime.now();if(c.text==prompt){final ms=max(1,DateTime.now().difference(start!).inMilliseconds);setState(()=>msg='Done in '+(ms/1000).toStringAsFixed(2)+'s');}}@override Widget build(BuildContext cxt)=>Padding(padding:const EdgeInsets.all(18),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(prompt,textAlign:TextAlign.center,style:const TextStyle(fontSize:23,fontWeight:FontWeight.w900)),const SizedBox(height:18),TextField(controller:c,onChanged:(_)=>check(),maxLines:3),const SizedBox(height:12),Text(msg)]));}

class ClickerGame extends StatefulWidget{const ClickerGame({super.key});@override State<ClickerGame>createState()=>_ClickerState();}
class _ClickerState extends State<ClickerGame>{int score=0,sec=10;Timer?timer;@override void dispose(){timer?.cancel();super.dispose();}void tap(){if(sec==0){score=0;sec=10;timer?.cancel();timer=Timer.periodic(const Duration(seconds:1),(_){if(!mounted)return;setState(()=>sec=max(0,sec-1));});setState((){});}else setState(()=>score++);} @override Widget build(BuildContext c)=>GestureDetector(onTap:tap,child:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text('Time: '+sec.toString()),Text('Score: '+score.toString(),style:const TextStyle(fontSize:42,fontWeight:FontWeight.w900)),const Icon(Icons.touch_app,size:90)])));}

class NumberGame extends StatefulWidget{const NumberGame({super.key});@override State<NumberGame>createState()=>_NumberState();}
class _NumberState extends State<NumberGame>{final c=TextEditingController();final r=Random();int target=0;String msg='Guess 1-100';@override void initState(){super.initState();target=1+r.nextInt(100);}@override void dispose(){c.dispose();super.dispose();}void check(){final n=int.tryParse(c.text);if(n==null)return;setState(()=>msg=n==target?'Correct':n<target?'Higher':'Lower');}@override Widget build(BuildContext cxt)=>Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(msg,style:const TextStyle(fontSize:27,fontWeight:FontWeight.w900)),TextField(controller:c,keyboardType:TextInputType.number),FilledButton(onPressed:check,child:const Text('Guess')),TextButton(onPressed:()=>setState(()=>target=1+r.nextInt(100)),child:const Text('New Number'))]));}

class RpsGame extends StatefulWidget{const RpsGame({super.key});@override State<RpsGame>createState()=>_RpsState();}
class _RpsState extends State<RpsGame>{final r=Random();final c=['Rock','Paper','Scissors'];String msg='Choose';void play(int p){final cpu=r.nextInt(3);final win=(p==0&&cpu==2)||(p==1&&cpu==0)||(p==2&&cpu==1);setState(()=>msg='You '+c[p]+' • CPU '+c[cpu]+' • '+(p==cpu?'Draw':win?'You win':'CPU wins'));}@override Widget build(BuildContext cxt)=>Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(msg),...List.generate(3,(i)=>Padding(padding:const EdgeInsets.all(4),child:FilledButton.tonal(onPressed:()=>play(i),child:Text(c[i]))))]));}

class SudokuGame extends StatelessWidget{const SudokuGame({super.key});@override Widget build(BuildContext c)=>Center(child:Padding(padding:const EdgeInsets.all(25),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[const Text('4×4 Sudoku',style:TextStyle(fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:16),const Text('1 2 | 3 _\n3 _ | 1 2\n_ 3 | _ 4\n4 _ | 2 1',textAlign:TextAlign.center,style:TextStyle(fontSize:26)),FilledButton(onPressed:()=>showDialog(context:c,builder:(_)=>const AlertDialog(content:Text('حل الصفوف والأعمدة بدون تكرار.'))),child:const Text('Check'))])));}

class CheckersGame extends StatefulWidget{const CheckersGame({super.key});@override State<CheckersGame>createState()=>_CheckersState();}
class _CheckersState extends State<CheckersGame>{int selected=-1;@override Widget build(BuildContext c)=>Column(children:[Expanded(child:GridView.builder(padding:const EdgeInsets.all(16),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:8),itemCount:64,itemBuilder:(_,i){final dark=((i~/8+i%8)%2)==1;final piece=[0,2,5,7,8,10,13,15,16,18,21,23].contains(i);return InkWell(onTap:dark?()=>setState(()=>selected=i):null,child:Container(color:dark?const Color(0xFF333333):const Color(0xFF111111),child:Center(child:Text(piece?'●':'',style:TextStyle(color:selected==i?Colors.black:Colors.white,fontSize:28)))));})),Text(selected<0?'Select a piece':'Selected '+selected.toString())]);}

class RunnerGame extends StatefulWidget{const RunnerGame({super.key});@override State<RunnerGame>createState()=>_RunnerState();}
class _RunnerState extends State<RunnerGame>{int lane=1,score=0,obstacle=0;Timer?timer;@override void initState(){super.initState();timer=Timer.periodic(const Duration(milliseconds:650),(_){if(mounted)setState((){score++;obstacle=Random().nextInt(3);});});}@override void dispose(){timer?.cancel();super.dispose();}@override Widget build(BuildContext c)=>Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text('Score: '+score.toString(),style:const TextStyle(fontSize:30,fontWeight:FontWeight.w900)),const SizedBox(height:20),Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:List.generate(3,(i)=>GestureDetector(onTap:()=>setState(()=>lane=i),child:Container(width:70,height:180,color:i==lane?Colors.white:const Color(0xFF111111),child:Center(child:Text(i==obstacle?'×':'',style:TextStyle(color:i==lane?Colors.black:Colors.white,fontSize:38)))))))]);}

class MazeGame extends StatefulWidget{const MazeGame({super.key});@override State<MazeGame>createState()=>_MazeState();}
class _MazeState extends State<MazeGame>{Point<int>p=const Point(0,0);final block={const Point(1,0),const Point(1,1),const Point(3,2),const Point(3,3)};void move(int dx,int dy){final n=Point(p.x+dx,p.y+dy);if(n.x<0||n.y<0||n.x>4||n.y>4||block.contains(n))return;setState(()=>p=n);}@override Widget build(BuildContext c)=>Column(children:[Expanded(child:GridView.builder(padding:const EdgeInsets.all(30),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:5,crossAxisSpacing:4,mainAxisSpacing:4),itemCount:25,itemBuilder:(_,i){final q=Point(i%5,i~/5);return Container(color:q==p?Colors.white:block.contains(q)?const Color(0xFF552222):q==const Point(4,4)?Colors.white70:const Color(0xFF111111),child:Center(child:Text(q==p?'●':q==const Point(4,4)?'★':'',style:TextStyle(color:q==p?Colors.black:Colors.white))));})),Text(p==const Point(4,4)?'You escaped!':'Reach the star'),Wrap(children:[IconButton(onPressed:()=>move(0,-1),icon:const Icon(Icons.keyboard_arrow_up)),IconButton(onPressed:()=>move(-1,0),icon:const Icon(Icons.keyboard_arrow_left)),IconButton(onPressed:()=>move(1,0),icon:const Icon(Icons.keyboard_arrow_right)),IconButton(onPressed:()=>move(0,1),icon:const Icon(Icons.keyboard_arrow_down))])]);}

class RandomFunGame extends StatefulWidget{const RandomFunGame({super.key});@override State<RandomFunGame>createState()=>_RandomFunState();}
class _RandomFunState extends State<RandomFunGame>{final r=Random();String prompt='اضغط Random';final list=const['اكتب 5 كلمات بنفس الحرف','جاوب trivia في 5 ثواني','احفظ 6 أرقام','خمن شخصية من 3 clues','اكتشف سر القضية الجديدة'];@override Widget build(BuildContext c)=>Center(child:Padding(padding:const EdgeInsets.all(25),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(prompt,textAlign:TextAlign.center,style:const TextStyle(fontSize:27,fontWeight:FontWeight.w900)),const SizedBox(height:20),FilledButton(onPressed:()=>setState(()=>prompt=list[r.nextInt(list.length)]),child:const Text('Random Challenge'))])));}

class FakeTerminalGame extends StatefulWidget {
  const FakeTerminalGame({super.key});
  @override State<FakeTerminalGame> createState() => _TerminalState();
}
class _TerminalState extends State<FakeTerminalGame> {
  final TextEditingController controller = TextEditingController();
  final List<String> lines = ['HYOUKA SIM TERMINAL', 'sandbox ready'];

  void runCommand() {
    final command = controller.text.trim();
    if (command.isEmpty) return;
    setState(() {
      lines.add('> $command');
      lines.add(const ['ACCESS CHECK: PASS', 'SIMULATION COMPLETE', 'NO REAL SYSTEM ACTION'][0]);
      controller.clear();
    });
  }
  @override void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(14),
    child: Column(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xFF080808),
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: lines.map((line) => Text(line, style: const TextStyle(fontFamily: 'monospace'))).toList(),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(child: TextField(controller: controller)),
            IconButton(onPressed: runCommand, icon: const Icon(Icons.send)),
          ],
        ),
      ],
    ),
  );
}

class EscapeGame extends StatefulWidget{const EscapeGame({super.key});@override State<EscapeGame>createState()=>_EscapeState();}
class _EscapeState extends State<EscapeGame>{final c=TextEditingController();String msg='Find the code: 3142';void unlock()=>setState(()=>msg=c.text.trim()=='3142'?'Unlocked!':'Wrong code');@override void dispose(){c.dispose();super.dispose();}@override Widget build(BuildContext cxt)=>Center(child:Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[const Icon(Icons.lock,size:70),const Text('Escape Room',style:TextStyle(fontSize:30,fontWeight:FontWeight.w900)),Text(msg),TextField(controller:c,keyboardType:TextInputType.number),FilledButton(onPressed:unlock,child:const Text('Unlock'))])));}

class BossGame extends StatefulWidget{const BossGame({super.key});@override State<BossGame>createState()=>_BossState();}
class _BossState extends State<BossGame>{int hp=100;final q=trivia[0];@override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.all(20),child:Column(children:[Text('Boss HP: '+hp.toString(),style:const TextStyle(fontSize:28,fontWeight:FontWeight.w900)),Text(q.text,textAlign:TextAlign.center),const Spacer(),...List.generate(q.options.length,(i)=>Padding(padding:const EdgeInsets.only(bottom:8),child:FilledButton.tonal(onPressed:hp==0?null:()=>setState(()=>hp=max(0,hp-(i==q.answer?25:5))),child:Text(q.options[i])))),if(hp==0)const Text('Boss defeated!',style:TextStyle(fontSize:24,fontWeight:FontWeight.w900))]));}
