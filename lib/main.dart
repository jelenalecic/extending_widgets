import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
            child: Container(
                color: Colors.blueGrey,
                child: SafeArea(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      ParentStatelessWidget(),
                      BabyStatelessWidget(),
                      ParentStatefulWidget(),
                      BabyStatefulWidget()
                    ])))));
  }
}

class ParentStatelessWidget extends StatelessWidget {
  String get name => 'Parent stateless';
  final Color background = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        height: 80,
        width: 200,
        color: background,
        child: Text(name.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontWeight: FontWeight.w500)));
  }
}

class BabyStatelessWidget extends ParentStatelessWidget {
  String get name => 'Baby stateless';
  final Color background = Colors.pink[300];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        margin: EdgeInsets.all(10),
        child: super.build(context));
  }
}

class ParentStatefulWidget extends StatefulWidget {
  final String name = 'Parent stateful';
  final Color color = Colors.orange;

  @override
  ParentStatefulWidgetState createState() => ParentStatefulWidgetState();
}

class ParentStatefulWidgetState<T extends ParentStatefulWidget>
    extends State<T> {
  Color tempColor;

  @override
  void initState() {
    super.initState();
    tempColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tempColor = getRandomColor();
        });
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          height: 200,
          width: 200,
          decoration: BoxDecoration(color: tempColor, shape: BoxShape.circle),
          child: Text(widget.name.toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500))),
    );
  }
}

class BabyStatefulWidget extends ParentStatefulWidget {
  final String name = 'Baby stateful';
  final Color color = Colors.green;

  @override
  BabyStatefulWidgetState createState() => BabyStatefulWidgetState();
}

class BabyStatefulWidgetState
    extends ParentStatefulWidgetState<BabyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        height: 200,
        width: 200,
        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: super.build(context));
  }
}

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
      255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}
