import 'dart:math';

enum QuestionDifficulty { easy, medium, hard, expert }

String questionDifficultyLabel(QuestionDifficulty difficulty) {
  switch (difficulty) {
    case QuestionDifficulty.easy: return 'سهل';
    case QuestionDifficulty.medium: return 'متوسط';
    case QuestionDifficulty.hard: return 'صعب';
    case QuestionDifficulty.expert: return 'خبير';
  }
}

int questionBasePoints(QuestionDifficulty difficulty) {
  switch (difficulty) {
    case QuestionDifficulty.easy: return 5;
    case QuestionDifficulty.medium: return 10;
    case QuestionDifficulty.hard: return 15;
    case QuestionDifficulty.expert: return 20;
  }
}

String _normalizeQuestionText(String value) {
  var text = value.toLowerCase().trim();
  const removable = <String>[
    'اختر الإجابة الصحيحة: ',
    'معلومة سريعة: ',
    'من الشخصية ',
    'اختر الشخصية ',
    'أي اسم يطابق الوصف: ',
    'خمن الشخصية: ',
    'من أنا؟ ',
    'هل العبارة صحيحة؟ ',
    'لغز: ',
  ];
  var changed = true;
  while (changed) {
    changed = false;
    for (final prefix in removable) {
      if (text.startsWith(prefix)) {
        text = text.substring(prefix.length).trim();
        changed = true;
      }
    }
  }
  text = text.replaceAll(RegExp(r'[؟?!.:,؛،…]+'), ' ');
  return text.replaceAll(RegExp(r'\s+'), ' ').trim();
}

class Q {
  final String text;
  final List<String> options;
  final int answer;
  final QuestionDifficulty difficulty;

  const Q(this.text, this.options, this.answer, {this.difficulty = QuestionDifficulty.medium});

  Q withDifficulty(QuestionDifficulty value) =>
      Q(text, options, answer, difficulty: value);

  String get key {
    final normalizedOptions = options.toSet().toList()..sort();
    return _normalizeQuestionText(text) + '|' + normalizedOptions.join('|');
  }
}

int pickIndex(int seed, int salt, int length) => _pick(seed, salt, length);
String arNumber(int value) => _arNumber(value);

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

class _TwentyFact {
  final String object;
  final List<String> yes;
  final List<String> no;
  const _TwentyFact(this.object, this.yes, this.no);
}

const _twentyFacts = <_TwentyFact>[
  _TwentyFact('الهاتف',['يمكن حمله','قد يحتوي على شاشة','يستخدم للاتصال','يحتاج طاقة للعمل'],['ينمو على الأشجار','هو نوع من الحيوانات','يعيش في البحر','يُزرع في التربة']),
  _TwentyFact('الكتاب',['يمكن قراءته','قد يحتوي على صفحات','يمكن تخزينه في مكتبة','قد يحمل معلومات'],['يحتاج وقودًا للطيران','يعيش في الماء','له محرك سيارة','يُستخدم كحيوان أليف']),
  _TwentyFact('السيارة',['يمكن قيادتها','قد تحتوي على محرك','تحتاج طاقة للحركة','يمكن نقل أشخاص بها'],['تطير عادة بلا أجنحة','تنمو من بذرة','تعيش في البحر','تُقرأ من صفحة لصفحة']),
  _TwentyFact('الدراجة',['لها عجلتان','يمكن ركوبها','يمكن تحريكها بالدواسات','تحتاج توازنًا أثناء القيادة'],['لها جناحان للطيران','تنمو في التربة','تُقرأ ككتاب','تعيش في المحيط']),
  _TwentyFact('الحاسوب',['يحتاج طاقة','يمكنه تشغيل البرامج','قد يحتوي على شاشة','يمكن استخدامه للكتابة'],['ينمو من البذور','يعيش في الغابة','هو طعام','يمتلك ساقين']),
  _TwentyFact('الكرة',['يمكن ركلها','يمكن رميها','لها شكل دائري غالبًا','تستخدم في ألعاب مختلفة'],['تحتاج صفحات لقراءتها','تنمو على شجرة','هي وسيلة نقل','تحتاج شبكة كهرباء لتكون كرة']),
  _TwentyFact('المظلة',['تحمي من المطر','يمكن فتحها وإغلاقها','يمكن حملها باليد','قد تستخدم في الطقس الماطر'],['تحتاج وقودًا للطيران','هي جهاز ألعاب','تنمو من التربة','تحتوي على محرك سيارة']),
  _TwentyFact('الحقيبة',['يمكن حملها','تستخدم لتخزين أشياء','قد يكون لها سحاب','توجد بأحجام مختلفة'],['تحتاج عجلات لتكون حقيبة','تعيش في البحر','تُزرع في الأرض','هي كوكب']),
  _TwentyFact('الساعة',['تُستخدم لمعرفة الوقت','قد تحتوي على أرقام','يمكن ارتداؤها في بعض الأنواع','قد تعمل ببطارية'],['تحتاج صفحات لقراءتها','تنمو من بذرة','هي وسيلة نقل','تعيش في الغابة']),
  _TwentyFact('المصباح',['يضيء عند تشغيله','يحتاج طاقة غالبًا','يمكن وضعه في المنزل','قد يحتوي على مفتاح'],['يُربّى كحيوان','ينمو في الحديقة','هو كتاب','يستخدم كإطار سيارة']),
  _TwentyFact('السماعة',['تخرج صوتًا','قد تتصل بجهاز','قد تحتاج طاقة','يمكن استخدامها للاستماع'],['تُزرع في التربة','هي نوع فاكهة','تحتاج مقودًا للقيادة','تعيش كسمكة']),
  _TwentyFact('الطائرة',['تستطيع الطيران','تنقل أشخاصًا','تحتاج طاقة للحركة','لها أجنحة'],['تنمو من بذرة','تُقرأ من صفحات','هي نوع نبات','تُشرب كعصير']),
  _TwentyFact('القطار',['يسير على سكة حديدية','ينقل ركابًا','يحتاج طاقة للحركة','قد يتكون من عدة عربات'],['ينمو على شجرة','يعيش في المحيط','له صفحات كتاب','يستخدم كحقيبة يد']),
  _TwentyFact('القلم',['يستخدم للكتابة','يمكن حمله باليد','قد يحتوي على حبر','يمكن الاحتفاظ به في حقيبة'],['يحتاج وقودًا للطيران','يعيش في الماء','هو وسيلة نقل','ينمو من التربة']),
  _TwentyFact('الكاميرا',['تلتقط صورًا','قد تحتوي على عدسة','يمكنها تسجيل فيديو في بعض الأنواع','تحتاج طاقة في كثير من الأنواع'],['تنمو من بذرة','هي نوع فاكهة','تعيش في البحر','هي وسيلة نقل']),
  _TwentyFact('التلفاز',['يعرض صورًا','يعرض فيديو','قد يحتاج اتصالًا بمصدر إشارة','يحتاج طاقة'],['يُزرع في الحديقة','هو دراجة','يعيش كحيوان','يُستخدم كحذاء']),
  _TwentyFact('الحذاء',['يُلبس في القدم','يساعد على حماية القدم','يتوفر بمقاسات مختلفة','يمكن صنعه من مواد مختلفة'],['يعيش في الماء كسمكة','يحتاج محركًا','يُقرأ ككتاب','ينمو من بذرة']),
  _TwentyFact('المفتاح',['يمكن استخدامه لفتح قفل','يمكن حمله','قد يكون معدنيًا','قد يوجد مع سلسلة مفاتيح'],['يحتاج طاقة ليكون مفتاحًا','هو نوع طعام','ينمو في التربة','يُستخدم ككتاب']),
  _TwentyFact('الطاولة',['لها سطح','يمكن وضع أشياء عليها','توجد في المنازل والمكاتب','قد تكون مصنوعة من الخشب'],['تطير وحدها عادة','تنمو من بذرة بعد صناعتها','تعيش في البحر','تُقرأ ككتاب']),
  _TwentyFact('الشجرة',['تنمو في التربة','لها جذور','قد تحمل أوراقًا','تحتاج الماء للنمو'],['تستخدم كحاسوب محمول','تحتوي على محرك سيارة','تُلبس في القدم','تحتاج شبكة هاتف للعمل']),
  _TwentyFact('الباب',['يمكن فتحه وإغلاقه','قد يحتوي على قفل','يمكن أن يفصل بين غرفتين','قد يكون مصنوعًا من الخشب أو المعدن'],['ينمو من التربة','هو حيوان','يطير بلا أجنحة عادة','يحتاج وقودًا للقيادة']),
  _TwentyFact('النافذة',['تسمح بمرور الضوء في بعض الأنواع','يمكن فتحها وإغلاقها في أنواع كثيرة','قد تكون من الزجاج','توجد في المباني'],['تحتاج محركًا للطيران','هي نوع من الفاكهة','تنمو من بذرة','تعيش كسمكة']),
  _TwentyFact('الكرسي',['يمكن الجلوس عليه','له مقعد','قد يكون له أرجل','يوجد في المنازل والمكاتب'],['يحتاج طريقًا للقيادة','يعيش في البحر','يحتوي على بذور ليكبر','يُستخدم لقراءة الوقت']),
  _TwentyFact('المروحة',['تحرك الهواء','قد تعمل بالكهرباء','لها شفرات في أنواع كثيرة','تُستخدم للتهوية'],['تنتج الحليب','تنمو كعشب','تُلبس في القدم','هي وسيلة نقل']),
  _TwentyFact('الثلاجة',['تحافظ على برودة الطعام','تحتاج طاقة في الأنواع الكهربائية','توجد في المطابخ','لها باب'],['تطير في السماء','هي حيوان أليف','تُقرأ ككتاب','تنمو في الحديقة']),
];

Q generateTwentyQuestion(int seed) {
  if (_pick(seed, 90, 4) != 3) {
    final fact = _twentyFacts[_pick(seed, 91, _twentyFacts.length)];
    final truth = _pick(seed, 92, 2) == 0;
    final pool = truth ? fact.yes : fact.no;
    final property = pool[_pick(seed, 93, pool.length)];
    final wording = _pick(seed, 94, 5);
    final text = switch (wording) {
      0 => 'هل ' + fact.object + ' ' + property + '؟',
      1 => 'هل من الصحيح أن ' + fact.object + ' ' + property + '؟',
      2 => 'بالنسبة إلى ' + fact.object + '، هل ' + property + '؟',
      3 => 'سؤال عشرين: هل ' + fact.object + ' ' + property + '؟',
      _ => 'فكّر جيدًا: هل ' + fact.object + ' ' + property + '؟',
    };
    return Q(text, ['نعم','لا'], truth ? 0 : 1);
  }

  final a = 10 + _pick(seed, 95, 990);
  final b = 1 + _pick(seed, 96, 990);
  final mode = _pick(seed, 97, 4);
  late final String text;
  late final bool truth;
  switch (mode) {
    case 0:
      text = 'هل العدد ' + _arNumber(a) + ' زوجي؟';
      truth = a.isEven;
    case 1:
      text = 'هل ' + _arNumber(a) + ' أكبر من ' + _arNumber(b) + '؟';
      truth = a > b;
    case 2:
      final divisor = 2 + _pick(seed, 99, 12);
      text = 'هل ' + _arNumber(a) + ' يقبل القسمة على ' + _arNumber(divisor) + ' دون باقٍ؟';
      truth = a % divisor == 0;
    default:
      final sum = a + b;
      final shown = sum + (_pick(seed, 100, 3) == 0 ? 0 : 1 + _pick(seed, 101, 4));
      text = 'هل ' + _arNumber(a) + ' + ' + _arNumber(b) + ' = ' + _arNumber(shown) + '؟';
      truth = shown == sum;
  }
  final correct = truth ? 'نعم' : 'لا';
  final wrong = truth ? 'لا' : 'نعم';
  final options = _shuffleOptions(correct, [wrong], seed);
  return Q(text, options, options.indexOf(correct));
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
  final a = 2 + _pick(seed, 131, 999);
  final b = 1 + _pick(seed, 132, 999);
  final actual = a + b;
  final truth = _pick(seed, 133, 2) == 0;
  final shown = truth ? actual : actual + 1 + _pick(seed, 134, 9);
  final correct = truth ? 'صح' : 'غلط';
  final wrong = truth ? 'غلط' : 'صح';
  final options = _shuffleOptions(correct, [wrong], seed);
  return Q(
    'هل العبارة صحيحة؟ ' + _arNumber(a) + ' + ' + _arNumber(b) + ' = ' + _arNumber(shown),
    options,
    options.indexOf(correct),
  );
}

Q generateCompareQuestion(int seed) {
  final a = 5 + _pick(seed, 141, 5000);
  var b = 5 + _pick(seed, 142, 5000);
  if (a == b) b++;
  final correct = a > b ? _arNumber(a) : _arNumber(b);
  final smaller = a > b ? _arNumber(b) : _arNumber(a);
  return _mcq('أي عدد أكبر: ' + _arNumber(a) + ' أم ' + _arNumber(b) + '؟',correct,[smaller,'متساويان',_arNumber(max(a,b)+1)],seed);
}

