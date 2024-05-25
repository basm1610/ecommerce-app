import 'package:flutter/material.dart';

class TitleAndDescriptionWidget extends StatelessWidget {
  final String title;
  final String des;
   TitleAndDescriptionWidget({Key? key, required this.title, required this.des}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        Text(
         des,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ],),

    );
  }
}
