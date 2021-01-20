import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  IconData icon;
  Function onPress;
  RoundIconButton(@required IconData icon, @required Function onPress) {
    this.icon = icon;
    this.onPress = onPress;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: Color(0xFF263240),
      child: Icon(
        icon,
        size: 32,
      ),
      shape: CircleBorder(),
    );
  }
}