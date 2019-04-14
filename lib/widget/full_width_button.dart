import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  const FullWidthButton({
    Key key,
    this.onPressed,
    this.text,
    this.fontSize = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize),
          ),
          padding: EdgeInsets.all(16),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
