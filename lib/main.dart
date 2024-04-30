import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './ui_helper/operation_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Practice app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
  //
  // @override
  // State<MyHomePage> createState() => _MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var operandOneController = TextEditingController();
  var operandTwoController = TextEditingController();
  double? result = 0.0;
  var calculator = OperationUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade500,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          color: Colors.orange.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: operandOneController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: operandTwoController,
                  )),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculator.GetOperationButton(operandOneController, operandTwoController, result, '+', (double updatedResult){
                    setState(() {
                      result = updatedResult;
                    });
                  }) ,
                  calculator.GetOperationButton(operandOneController, operandTwoController, result, '-', (double updatedResult){
                    setState(() {
                      result = updatedResult;
                    });
                  }),
                  calculator.GetOperationButton(operandOneController, operandTwoController, result, 'x', (double updatedResult){
                    setState(() {
                      result = updatedResult;
                    });
                  }),
                  calculator.GetOperationButton(operandOneController, operandTwoController, result, '/', (double updatedResult){
                    setState(() {
                      result = updatedResult;
                    });
                  })
                ],
              ),
              SizedBox(height: 60),
              Container(
                  child: Text(
                'Result is ${result.toString()}',
                style: TextStyle(fontSize: 25),
              ))
            ],
          )),
    );
  }
}