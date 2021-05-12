import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genmapper Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Genmapper'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final Church church =
      Church(name: "coole Kirche"); //create test church instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DisplayChurch(church),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DisplayChurch extends StatefulWidget {
  //Widget to display one church object
  final Church church;
  DisplayChurch(this.church);
  @override
  _DisplayChurchState createState() => _DisplayChurchState();
}

class _DisplayChurchState extends State<DisplayChurch> {
  bool isToggled; //is the mouse cursor in the widget area?

  @override
  void initState() {
    super.initState();
    isToggled =
        false; //defaults to false, Todo: probably check if cursor is in the widget area
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      //detects mouse movements
      onEnter: (_) {
        setState(() {
          isToggled = !isToggled;
        });
      },
      onExit: (_) {
        setState(() {
          isToggled = !isToggled;
        });
      },
      child: CustomPaint(
        //widget for painting stuff
        size: Size(200, 200),
        painter: ChurchPainter(widget.church, isToggled),
      ),
    );
  }
}

class ChurchPainter extends CustomPainter {
  //actually paint the church
  Church church;
  bool isToggled;
  ChurchPainter(this.church, this.isToggled);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint();
    circlePaint.color = Colors.black;
    circlePaint.style = PaintingStyle.stroke;
    Paint fillCircle = Paint()..color = isToggled ? Colors.blue : Colors.red;
    final textStyle = ui.TextStyle(
      color: Colors.black,
      fontSize: 30,
    );
    final paragraphStyle = ui.ParagraphStyle();
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      //..pushStyle(textStyle)
      ..addText(church.name);
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    final offset = Offset(0, 0);
    canvas.drawParagraph(paragraph, offset);
    canvas.drawCircle(Offset(100, 100), 100, circlePaint);
    canvas.drawCircle(Offset(100, 100), 99, fillCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true; //todo: write condition when to repaint
}
