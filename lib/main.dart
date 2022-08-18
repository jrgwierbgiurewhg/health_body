import 'package:flutter/material.dart';
import 'constants.dart';
import 'result_page.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const start_page(),
    );
  }
}

enum Gender { Male, Female }

class start_page extends StatefulWidget {
  const start_page({Key? key}) : super(key: key);

  @override
  State<start_page> createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  Gender gender = Gender.Male;
  var age = 20;
  var height = 150;
  var weight = 50;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              //Выбор пола
              children: <Widget>[
                Expanded(
                    child: user_card(
                  ontouch: () {
                    setState(() {
                      gender = Gender.Male;
                    });
                  },
                  color: gender == Gender.Male
                      ? activeManCardColor
                      : inactiveCardColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/man.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: 20),
                        Text('Мужской', style: body_text_style)
                      ]),
                )),
                Expanded(
                    child: user_card(
                  ontouch: () {
                    setState(() {
                      gender = Gender.Female;
                    });
                  },
                  color: gender == Gender.Female
                      ? activeWomanCardColor
                      : inactiveCardColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/woman.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: 20),
                        Text('Женский', style: body_text_style)
                      ]),
                )),
              ],
            ),
          ),
          Expanded(
            child: user_card(
                //Рост
                ontouch: () {
                  height = height;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Рост',
                      style: body_text_style,
                    ),
                    Text(
                      height.toString(),
                      style: number_text_style,
                    ),
                    Slider(
                      min: 130,
                      max: 220,
                      activeColor: bottomContainerColor,
                      value: height.toDouble(),
                      onChanged: ((value) {
                        setState(() {
                          height = value.round();
                        });
                      }),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(children: <Widget>[
              //Вес и возраст
              Expanded(
                  child: user_card(
                ontouch: () {
                  weight = weight;
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Вес', style: body_text_style),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Text(
                        weight.toString(),
                        style: number_text_style,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(Icons.remove),
                              shape: const CircleBorder(),
                              elevation: 10,
                              fillColor: buttonContainerColor,
                              padding: EdgeInsets.all(5)),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              shape: CircleBorder(),
                              elevation: 10,
                              fillColor: buttonContainerColor,
                              padding: EdgeInsets.all(5)),
                        ],
                      )
                    ]),
              )),
              Expanded(
                  child: user_card(
                ontouch: () {
                  age = age;
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Возраст', style: body_text_style),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Text(
                        age.toString(),
                        style: number_text_style,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove),
                              shape: const CircleBorder(),
                              elevation: 10,
                              fillColor: buttonContainerColor,
                              padding: EdgeInsets.all(5)),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              shape: CircleBorder(),
                              elevation: 10,
                              fillColor: buttonContainerColor,
                              padding: EdgeInsets.all(5)),
                        ],
                      )
                    ]),
              )),
            ]),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              double bmi = weight / (math.pow(height / 100, 2));
              double bmr;
              if (gender == Gender.Male) {
                bmr = 66 + (13.7 * weight) + (5 * height) - (6.76 * age) * 1.2;
              } else {
                bmr = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age) * 1.2;
              }
              bmi = ((bmi * 100).toInt()).toDouble() / 100;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: bmi,
                            bmr: bmr,
                          )));
            },
            child: Container(
              height: 80,
              color: bottomContainerColor,
              child: Center(
                  child: Text(
                'Вычислить',
                style: large_button_text_style,
              )),
            ),
          )
        ],
      ),
    );
  }
}

class user_card extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback ontouch;
  const user_card({
    Key? key,
    this.color = inactiveCardColor,
    required this.child,
    required this.ontouch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontouch,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
