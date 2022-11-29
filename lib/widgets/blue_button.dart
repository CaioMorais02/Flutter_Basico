import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;

  BlueButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
            style: ElevatedButton.styleFrom(
            primary: Colors.blue,
                onPrimary: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20,
                )
            ),
            onPressed:() => onPressed(),

            child: Text(text)
            )
          ],
        )
      ],
    );
  }
}
