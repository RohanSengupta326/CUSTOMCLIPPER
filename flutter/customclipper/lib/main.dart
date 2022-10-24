import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Clipper'),
        ),
        body: Center(
          child: ClipPath(
            clipper: Clipper(),
            child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(250, 125, 10, 1),
                    Color.fromARGB(255, 255, 123, 0),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: Offset(0, 6),
                    color: Color.fromARGB(255, 255, 123, 0),
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size.height);
    var path = Path()
      ..moveTo(0, size.height * 0.33)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(0, size.height, 50, size.height)
      // to draw a curvature u have to first draw a line less than size.height like in prev line and then draw curvature
      // cehck the ss in assets folder quadraticBezierTo(x1, y1, x2, y2) x1,y1 = where originally it should have been, and x2,y2 = where it is going, x0,y0 by default is where it is from prev drawing
      ..lineTo(size.width - 50, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - 50)
      ..lineTo(size.width, 100)
      ..quadraticBezierTo(size.width, 0, size.width - 150, 70)
      ..lineTo(50, size.height * 0.33-20)
      ..quadraticBezierTo(0, size.height * 0.33, 0, size.height * 0.33 + 50);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
