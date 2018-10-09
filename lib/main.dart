import 'package:flutter/material.dart';
import 'package:screens_flutter/modal_one.dart';
import 'package:screens_flutter/modal_two.dart';
import 'package:screens_flutter/screen_four.dart';
import 'package:screens_flutter/screen_one.dart';
import 'package:screens_flutter/screen_three.dart';
import 'package:screens_flutter/screen_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(title: 'Screen 1'),
        '/2': (context) => SecondPage(title: 'Screen 2'),
        '/3': (context) => ThirdPage(title: 'Screen 3'),
        '/4': (context) => FourPage(),
        '/10': (context) => ModalOne(title: 'Modal 1'),
        '/11': (context) => ModalTwo(title: 'Modal 2'),
      },
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(secondaryAnimation),
          child: child,
        );
      }
  );
}
