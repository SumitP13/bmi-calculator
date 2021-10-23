import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    this.colour = const Color(0xFF2DBD3A),
    required this.cardChild,
    this.onPress,
  }) : super(key: key);

  final Color colour;
  final Widget cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress!(),
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
