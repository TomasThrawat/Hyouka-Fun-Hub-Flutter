import 'package:flutter_test/flutter_test.dart';
import 'package:hyouka_fun_hub/main.dart';
void main(){testWidgets('hub loads',(tester)async{await tester.pumpWidget(const HyoukaFunHub());expect(find.text('Hyouka Fun Hub'),findsOneWidget);expect(find.text('20 Questions'),findsOneWidget);expect(find.text('Snake'),findsOneWidget);expect(find.text('Fake Hacker Terminal'),findsOneWidget);});}
