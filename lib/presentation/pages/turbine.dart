import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class Turbine extends StatefulWidget {
  const Turbine({super.key});

  @override
  State<Turbine> createState() => _TurbineState();
}

class _TurbineState extends State<Turbine> with TickerProviderStateMixin {
  double rotation = 0;
  int seconds = 30;

  late Animation<double> animation;
  late AnimationController controller;

  late Animation<double> animation2;
  late AnimationController controller2;
  var _sides = 3.0;

  startAnimation() {
    //To slow down the animation
    rotation += 0.5;
    seconds--;
    setState(() {});
    if (seconds >= 0) {
      Future.delayed(Duration(seconds: 1), () {
        startAnimation();
      });
    }
  }

  double angle = 0.0;

  void _onPanUpdateHandler(DragUpdateDetails details) {
    final touchPositionFromCenter = details.localPosition;
    setState(
      () {
        angle = touchPositionFromCenter.direction;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    Tween<double> _radiusTween = Tween(begin: 0.0, end: 100);
    Tween<double> _rotationTween = Tween(begin: -180, end: 360);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    animation2 = _radiusTween.animate(controller2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller.forward();
    controller2.forward();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          backgroundColor: Colors.black54,
        ),
        backgroundColor: Colors.black,
        body: Stack(
            children: [


              Positioned(
                top: 10,
                left: 240,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(
                    'assets/ic_moon.svg',
                    //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                    semanticsLabel: 'A red up arrow',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
          Positioned(
            top: 0,
            left: 10,
            child: Container(
                child: CustomPaint(
                  painter: BigMountainPainter(Colors.teal),
                  child: Container(),
                )),
          ),
              Positioned(
                top: 0,
                left: 30,
                child: Container(
                    child: CustomPaint(
                      painter: BigMountainPainter(Colors.white38),
                      child: Container(),
                    )),
              ),
          Positioned(
            top: 0,
            left: 40,
            child: Container(
                child: CustomPaint(
                  painter: BigMountainPainter(Colors.grey),
                  child: Container(),
                )),
          ),

          Positioned(
            top: 100,
            child: Container(
                child: CustomPaint(
                  painter: ShapePainter(1, 100, 20),
                  child: Container(),
                )),
          ),




          Positioned(
            top: 100,
            left: 10,
            child: Container(
                child: CustomPaint(
                  painter: MountainPainter(Colors.greenAccent),
                  child: Container(),
                )),
          ),
          Positioned(
            top: 100,
            left: 40,
            child: Container(
                child: CustomPaint(
                  painter: MountainPainter(Colors.green),
                  child: Container(),
                )),
          ),
          Positioned(
            top: 100,
            left: 50,
            child: Container(
                child: CustomPaint(
                  painter: MountainPainter(Colors.green),
                  child: Container(),
                )),
          ),
          Positioned(
            top: 100,
            left: 90,
            child: Container(
                child: CustomPaint(
                  painter: MountainPainter(Colors.greenAccent),
                  child: Container(),
                )),
          ),


           Positioned(
             top: 250,
             left: 100,
             child: SizedBox(
               height: 200,
               width: 250,
               child: Slider(
                  value: _sides,
                  min: 3.0,
                  max: 100.0,
                  label: _sides.toInt().toString(),
                  divisions: 7,
                  onChanged: (value) {
                    setState(() {
                      _sides = value;
                    });
                  },
                ),
             ),
           ),

              Positioned(
                top: 280,
                left: 180,
                child: Container(child: Text(
                  'The winter should come\n for moon.Because she smiles\n good that time',
                  style: GoogleFonts.acme(textStyle: TextStyle(color: Colors.white)),
                ),
                ),
              ),



          Positioned(
            left: -5,
            top: 20,
            child: AnimatedBuilder(
                animation: animation,
                builder: (ctx, s) {
                  return Transform.rotate(
                    angle: animation.value * math.pi / 180,
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/ic_turbine_two.svg',
                        //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                        semanticsLabel: 'A red up arrow',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
            ),
          ),




        ]),
      ),
    );
  }
}

class BigMountainPainter extends CustomPainter {
  Color color;


  BigMountainPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var xValue = -50.0;
    for(int i = 0; i< 7; i++)
    {
      path.moveTo(xValue, 800);
      path.lineTo(xValue+ 70, 90);
      path.lineTo(xValue+ 400, 800);
      xValue = xValue+ 90;
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class MountainPainter extends CustomPainter {
  Color color;


  MountainPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var xValue = -50.0;
    for(int i = 0; i< 10; i++)
      {
        path.moveTo(xValue, 650);
        path.lineTo(xValue+ 90, 300);
        path.lineTo(xValue+ 220, 650);
        xValue = xValue+ 100;
      }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class MoonPainter extends CustomPainter {
  Color color;

  MoonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var xValue = -50.0;
    for(int i = 0; i< 10; i++)
    {
      path.moveTo(xValue, 650);
      path.lineTo(xValue+ 90, 300);
      path.lineTo(xValue+ 220, 650);
      xValue = xValue+ 100;
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  ShapePainter(this.sides, this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = kShrineBackgroundWhite
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(90, 0);
    path.lineTo(80, 900);
    path.lineTo(110, 900);
    path.lineTo(90, 0);



    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget CircleNumber(String num) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(color: kShrineBrown900, shape: BoxShape.circle),
    child: Text(
      "$num",
      style:
          TextStyle(color: kShrineBackgroundWhite, fontWeight: FontWeight.bold),
    ),
  );
}
