import 'package:bmi/constants.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.result,
      required this.emoji,
      required this.interpreter,
      required this.bmi})
      : super(key: key);

  final String result;
  final String emoji;
  final String bmi;
  final String interpreter;

  IconData iconPro() {
    return emoji == 'surprise'
        ? FontAwesomeIcons.surprise
        : emoji == 'frownOpen'
            ? FontAwesomeIcons.frownOpen
            : FontAwesomeIcons.grin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result, style: kResultTextStyle),
                  Icon(
                    iconPro(),
                    size: 80.0,
                    color: kBottomContainerColour,
                  ),
                  Text(bmi, style: kBmiTextStyle),
                  Text(
                    interpreter,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'RE-CALCULATE',
                style: kBottomButton,
              ),
              height: kBottomContainerHeight,
              width: double.infinity,
              color: kBottomContainerColour,
            ),
          ),
        ],
      ),
    );
  }
}
