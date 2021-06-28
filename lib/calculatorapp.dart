import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var result = "";

  Widget btn(var textt) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          //result = textt;
          result = result + textt;
        });
      },
      child: Text(textt),
      // style: ElevatedButton.styleFrom(
      //     textStyle: TextStyle(fontSize: 22),
      //     elevation: 7,
      //     shadowColor: Colors.grey),
    );
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cmd = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cmd);

    setState(() {
      result = eval.toString();
    });
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 50)),
          Center(
              child: Text(
            'CALCULATOR',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          Center(
            child: Container(
              width: 400,
              height: 350,
              padding: new EdgeInsets.only(
                  top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Card(
                  elevation: 6,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 25)),
                      Center(
                        child: Text(result,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      const Divider(
                        height: 5,
                        thickness: 3,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            btn("1"),
                            btn("2"),
                            btn("3"),
                            btn("+"),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [btn("4"), btn("5"), btn("6"), btn("-")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [btn("7"), btn("8"), btn("9"), btn("*")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: clearr,
                            child: Text('Clear'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red[300],
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                elevation: 7,
                                shadowColor: Colors.grey),
                          ),
                          btn("0"),
                          ElevatedButton(
                            onPressed: output,
                            child: Text('='),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red[300],
                                textStyle: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                                elevation: 7,
                                shadowColor: Colors.grey),
                          ),
                          btn("/"),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
