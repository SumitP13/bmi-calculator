import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/screens/calculator_brain.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;

  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 45;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    // var deviceHeight = MediaQuery.of(context).size.height - 80;
    return (Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: (selectedGender == Gender.male)
                        ? (kActiveCardColor)
                        : (kInActiveCardColor),
                    cardChild: const IconContent(
                      textName: 'MALE',
                      iconName: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: (selectedGender == Gender.female)
                        ? (kActiveCardColor)
                        : (kInActiveCardColor),
                    cardChild: const IconContent(
                      textName: 'FEMALE',
                      iconName: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(width: 2.5),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      trackHeight: 1,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 230.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: "btn2",
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn3",
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: "btn4",
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ResultsPage(
              //       result: calc.getResults(),
              //       emoji: calc.getEmoji(),
              //       interpreter: calc.getInterpretation(),
              //       bmi: calc.calculateBMI(),
              //     ),
              //   ),
              //
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calc.calculateBMI(),
                    result: calc.getResults(),
                    interpreter: calc.getInterpretation(),
                    emoji: calc.getEmoji(),
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'CALCULATE',
                style: kBottomButton,
              ),
              height: kBottomContainerHeight,
              width: double.infinity,
              color: kBottomContainerColour,
            ),
          ),
        ],
      ),
    ));
  }
}
