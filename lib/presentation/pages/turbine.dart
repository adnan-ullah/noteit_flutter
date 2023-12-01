import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
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

  late Animation<double> animation3;
  late AnimationController controller3;
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

    controller3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    Tween<double> _radiusTween = Tween(begin: 0.0, end: 100);
    Tween<double> _rotationTween = Tween(begin: -180, end: 360);
    Tween<double> _rotationTree = Tween(begin: -math.pi/120 , end: math.pi/120);

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

    animation3 = _rotationTree.animate(controller3)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller3.forward();
        }
      });

    controller.forward();
    controller2.forward();
    controller3.forward();

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
        backgroundColor: Color(0xFD06061A),
        body: Stack(
            children: [


              // Positioned(
              //   left: 0,
              //   top: 0,
              //   child: Container(
              //     height: Get.height,
              //     width: Get.width,
              //     child: Image.asset(
              //       'assets/ic_bg_2.jpg',
              //       //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),



              Positioned(
                top: 0,
                left: 160,
                child: Transform.rotate(
                  angle: 0.1,
                  child: Container(
                    height: 200,
                    width: 200,

                    child: SvgPicture.asset(
                      'assets/ic_moon.svg',
                      //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      semanticsLabel: 'A red up arrow',
                      fit: BoxFit.contain,
                      color: Color(0xffffe39b).withOpacity(1),
                    ),
                  ),
                ),
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
            child: AnimatedBuilder(
              animation: animation3,
              builder: (BuildContext context, Widget? child) {
               return  Transform.rotate(
                  angle: animation3.value,
                  child: Container(
                      child: CustomPaint(
                        painter: MountainPainter(Color(0xff70ad82)),
                        child: Container(),
                      )),
                );
              }
            ),
          ),
          Positioned(
            top: 100,
            left: 40,
            child: AnimatedBuilder(
            animation: animation3,
            builder: (BuildContext context, Widget? child) {
              return  Transform.rotate(
                angle: animation3.value,
                child: Container(
                    child: CustomPaint(
                      painter: MountainPainter( Color(0xff77b689)),
                      child: Container(),
                    )),
              );},
        ),
          ),

          Positioned(
            top: 100,
            left: 50,
            child: AnimatedBuilder(
              animation: animation3,

              builder: (BuildContext context, Widget? child) {
                return  Transform.rotate(
                  angle: animation3.value,
                  child: Container(
                      child: CustomPaint(
                        painter: MountainPainter( Color(0xff8eeeb6)),
                        child: Container(),
                      )),
                );
              },

            ),
          ),
          Positioned(
            top: 100,
            left: 90,
            child: AnimatedBuilder(
              animation: animation3,
              builder: (BuildContext context, Widget? child) {
                return  Transform.rotate(
                  angle: animation3.value,
                  child: Container(
                      child: CustomPaint(
                        painter: MountainPainter(Color(0xff144629)),
                        child: Container(),
                      )),
                );
              },
            ),
          ),


           // Positioned(
           //   top: 250,
           //   left: 100,
           //   child: SizedBox(
           //     height: 200,
           //     width: 250,
           //     child: Slider(
           //        value: _sides,
           //        min: 3.0,
           //        max: 100.0,
           //        label: _sides.toInt().toString(),
           //        divisions: 7,
           //        onChanged: (value) {
           //          setState(() {
           //            _sides = value;
           //          });
           //        },
           //      ),
           //   ),
           // ),

              Positioned(
                top: 220,
                left: 160,
                child: Container(child: Text(
                  '2:10 am',
                  style: GoogleFonts.aBeeZee(letterSpacing: 2,textStyle: TextStyle(color: Colors.white),fontSize: 40),
                ),
                ),
              ),


              Positioned(
                top: 280,
                left: 160,
                child: Container(child: Text(
                  'The winter should come\n for the moon because she smiles\n good at that time.',
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
                        color: Color(0xffffe4c8),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
            ),
          ),

              Positioned(
                bottom: 20,
                right: 20,
                child: Column(

                  children: [
                    FlutterLogo(size: 20,),
                    SizedBox(height: 10,),
                    Container(child: Text(
                      'adnan-ullah',
                      style: GoogleFonts.alkalami(letterSpacing: 2,textStyle:
                      TextStyle(color:Color(0xFFFFFFFF)),fontSize: 10),
                    ),
                    ),
                  ],
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
    var xValue = -120.0;
    for(int i = 0; i< 7; i++)
    {
      path.moveTo(xValue, 700);
      path.lineTo(xValue+ 140, 90);
      path.lineTo(xValue+ 500, 700);
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
    var xValue = -80.0;
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
