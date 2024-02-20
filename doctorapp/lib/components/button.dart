import 'package:doctorapp/utils/config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.width,
    required this.title,
    required this.onpress,
    required this.disable,
  }) : super(key: key);
  //  Keykey, required Future<Null> Function() onPressed

  final double width;
  final String title;
  final bool disable;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.primarycolor,
          foregroundColor: Colors.white,
        ),
        onPressed: disable ? null : onpress,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
