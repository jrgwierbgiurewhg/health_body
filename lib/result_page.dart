import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final double bmr;

  ResultPage({required this.bmi, required this.bmr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
      ),
      body: Center(
        //ИМТ
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text("ИМТ", style: result_text_style),
                SizedBox(height: 25.0),
                Text(bmi.toString(), style: result_text_style),
                SizedBox(
                  height: 20.0,
                ),
                bmidescription(bmi1: bmi, bmr: bmr, index: 0),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class bmidescription extends StatelessWidget {
  final double bmi1;
  final double bmr;
  int index;
  double picturesize;
  bmidescription(
      {Key? key,
      required this.bmi1,
      required this.bmr,
      required this.index,
      this.picturesize = 150})
      : super(key: key);

  void set_index() {
    if (bmi1 < 18.0) index = 0;
    if (bmi1 > 18.1 && bmi1 < 20.0) index = 1;
    if (bmi1 > 20.1 && bmi1 < 25.0) index = 2;
    if (bmi1 > 25.1 && bmi1 < 27.0) index = 3;
    if (bmi1 > 27.1 && bmi1 < 30.0) index = 4;
    if (bmi1 > 30.1 && bmi1 < 35.0) index = 5;
    if (bmi1 > 35.0) index = 6;
  }

  @override
  Widget build(BuildContext context) {
    set_index();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (index == 0) //Отрисока на экране мемного рисунка
            Image.asset(
              'assets/images/lvl-2.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          if (index == 1)
            Image.asset(
              'assets/images/lvl-1.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          if (index == 2)
            Image.asset(
              'assets/images/lvl0.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          if (index == 3)
            Image.asset(
              'assets/images/lvl1.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          if (index == 4)
            Image.asset(
              'assets/images/lvl2.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          if (index == 5)
            Image.asset(
              'assets/images/lvl3.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          if (index == 6)
            Image.asset(
              'assets/images/lvl4.png',
              height: picturesize,
              width: picturesize,
              fit: BoxFit.fitWidth,
            ),
          SizedBox(height: 20),
          Text(bmi[index].toString(), //Диагноз и симптомы
              textAlign: TextAlign.center,
              style: TextStyle(
                color: bmicolor[index],
                fontSize: 35.0,
              )),
          SizedBox(height: 20.0),
          Text(
            'Симптомы',
            style: number_text_style,
          ),
          SizedBox(height: 20.0),
          Center(
            child: Text(
              bmidescriptions[index].toString(),
              textAlign: TextAlign.center,
              style: body_text_style,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            //Базальный метобализм и решение в случае отклонения от нормы
            child: Text(
              "Ваш базальный метобализм составляет",
              textAlign: TextAlign.center,
              style: body_text_style,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            bmr.toString(),
            style: result_text_style,
          ),
          SizedBox(height: 20),
          if (index > 2)
            Center(
              child: Text(
                "Рекомендуется сократить потребление калорий на 500 ккал ниже уровня базального метаболизма",
                textAlign: TextAlign.center,
                style: body_text_style,
              ),
            ),
          if (index < 2)
            Center(
              child: Text(
                "Рекомендуется повысить потребление калорий на 500 ккал выше уровня базального метаболизма",
                textAlign: TextAlign.center,
                style: body_text_style,
              ),
            ),
        ]);
  }
}
