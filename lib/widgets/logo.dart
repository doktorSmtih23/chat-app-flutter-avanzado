import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;

  const Logo({
    Key key,
    @required this.text
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage('assets/tag-logo.png')),
          SizedBox(height: 20),
          Text(this.text, style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
