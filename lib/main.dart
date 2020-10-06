import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String output_ = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String op = "";
  buttonPressed(String buttonText) {
    if (buttonText == "CE") {
      output_ = "0";
      num1 = 0.0;
      num2 = 0.0;
      op = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);
      op = buttonText;

      output_ = "0";
    } else if (buttonText == ".") {
      if (output_.contains(".")) {
        print("Ya contiene decimales");
        return;
      } else {
        output_ = output_ + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (op == "+") {
        output_ = (num1 + num2).toString();
      }
      if (op == "-") {
        output_ = (num1 - num2).toString();
      }
      if (op == "x") {
        output_ = (num1 * num2).toString();
      }
      if (op == "/") {
        output_ = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      op = "";
    } else {
      output_ = output_ + buttonText;
    }
    print(output_);
    setState(() {
      output = double.parse(output_).toStringAsFixed(2);
    });
  }

  Widget builButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 12.0,
                  ),
                  child: new Text(output,
                      style: new TextStyle(
                        fontSize: 37.0,
                        fontWeight: FontWeight.bold,
                      ))),
              new Expanded(
                child: new Divider(),
              ),
              Column(
                children: [
                  Row(children: [
                    builButton("7"),
                    builButton("8"),
                    builButton("9"),
                    builButton("/"),
                  ]),
                  Row(children: [
                    builButton("4"),
                    builButton("5"),
                    builButton("6"),
                    builButton("x"),
                  ]),
                  Row(children: [
                    builButton("1"),
                    builButton("2"),
                    builButton("3"),
                    builButton("-"),
                  ]),
                  Row(children: [
                    builButton("."),
                    builButton("0"),
                    builButton("00"),
                    builButton("+"),
                  ]),
                  Row(children: [
                    builButton("CE"),
                    builButton("="),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
