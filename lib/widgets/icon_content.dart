import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColour;
  IconContent({this.icon, this.label, this.iconColour});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 80,
          color: iconColour,
        ),
        SizedBox(
          height: 30,
        ),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
