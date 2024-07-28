import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/intropage.dart';
import 'package:flutter_basics/pages/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _myHomePageState();
}

class _myHomePageState extends State<MyHomePage> {
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var wtcontroller = TextEditingController();
  var result = "";
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Center(
          child: Text(
            'BMI - CALCULATOR',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/BMI-calculator.png',
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtcontroller,
                    decoration: InputDecoration(
                        label: Text('Enter Your Weight(in kgs)'),
                        prefixIcon: Icon(Icons.monitor_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftcontroller,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in feets)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: incontroller,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in inches)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtcontroller.text.toString();
                      var ft = ftcontroller.text.toString();
                      var inc = incontroller.text.toString();

                      if (wt != "" && ft != "" && inc != "") {
                        //BMI CALCULATION
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var inch = int.parse(inc);

                        var tinch = (ift * 12) + inch;
                        var tcm = tinch * 2.54;
                        var tm = tcm / 100;

                        var bmi = iwt / (tm * tm);
                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are OverWeight"; //overweight
                          bgcolor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are UnderWeight"; //underweight
                          bgcolor = Colors.red.shade200;
                        } else {
                          msg = "You are Healthy"; //healthyweight
                          bgcolor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required blanks!!";
                        });
                      }
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 21),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
