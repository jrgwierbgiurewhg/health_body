import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const activeManCardColor = Color.fromARGB(255, 7, 193, 250);
const activeWomanCardColor = Color.fromARGB(255, 255, 6, 97);
const inactiveCardColor = Color(0xFF161A3C);
const backgroundcolor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const buttonContainerColor = Color(0xFF222747);

const label_text_Style = TextStyle(
  fontSize: 10.0,
  color: Color(0xFF8D8E98),
);

const number_text_style = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);

const large_button_text_style = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const title_text_style = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const result_text_style = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

const body_text_style = TextStyle(
  fontSize: 22.0,
);

const indicator_text_style = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const Map<int, String> bmi = {
  0: "Недостаток веса 2-й степени",
  1: "Недостаток веса 1-й степени",
  2: "Нормальный вес",
  3: "Лишний вес",
  4: "Ожирение 1-й степени",
  5: "Ожирение 2-й степени",
  6: "Ожирение 3-й степени",
};

const Map<int, String> bmidescriptions = {
  0: "Хроническая усталость, апатия, нехватка витаминов, истощение, остеопороз, анорексия и т.д.",
  1: "Проблемы пищеварения, истощение, стресс, хроническая усталость, низкий иммунитет, депрессия, гормональные нарушения и т.д.",
  2: "Высокий уровень энергии, хорошая физическая форма, жизнерадостность, психоэмоциональное равновесие и т.д.",
  3: "Хроническая усталость, проблемы пищеварения. сердечно-сосудистой системы, варикоз и т.д.",
  4: "Риск диабета, высокое давление, проблемы кровообращения, нарушение психики, проблемы суставов и т.д.",
  5: "Диабет не инсулинозависимый атеросклероз, стенокардия, инфаркт, тромбофлебит и т.д.",
  6: "Диабет инсулинозависимый, инфаркт, инсульт, рак"
};

const bmicolor = <Color>[
  Color(0xffeeff82),
  Color(0xfff2eb1d),
  Color(0xff0ff541),
  Color(0xfff0ca0e),
  Color(0xfff5a505),
  Color(0xfff57905),
  Color(0xfff54d05),
];
