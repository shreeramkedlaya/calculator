import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ques = '';
  var ans = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ques,
                      style: const TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      ans,
                      style: const TextStyle(color: Colors.white, fontSize: 56),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Button(
                      onTap: () {
                        setState(() {
                          ques = '';
                          ans = '';
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.white,
                    );
                  } else if (index == 1) {
                    return Button(
                      onTap: () {
                        setState(() {
                          ques = ques.substring(0, ques.length - 1);
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    return Button(
                      onTap: () {
                        setState(() {
                          equalto();
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.black87,
                      textcolor: Colors.white,
                    );
                  } else {
                    return Button(
                      onTap: () {
                        setState(() {
                          ques += buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.black
                          : Colors.black45,
                      textcolor: Colors.white,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalto() {
    String fq = ques;
    fq = fq.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(fq);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    ans = eval.toString();
  }
}
