import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.textName,
    required this.iconName,
  }) : super(key: key);

  final IconData iconName;
  final String textName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          textName,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
