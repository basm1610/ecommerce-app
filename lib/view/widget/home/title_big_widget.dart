import 'package:flutter/material.dart';

class BigTitleWidget extends StatelessWidget {
  final String text;
  const BigTitleWidget({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.red, fontSize: 25),
      ),
    );
  }
}
