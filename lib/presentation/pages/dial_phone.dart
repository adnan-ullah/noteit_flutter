import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialPhone extends StatefulWidget {
  const DialPhone({super.key});

  @override
  State<DialPhone> createState() => _DialPhoneState();
}

class _DialPhoneState extends State<DialPhone> with TickerProviderStateMixin {
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
    Tween<double> _rotationTween = Tween(begin:  -180, end: 360);

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
          backgroundColor: kShrinePink50,
        ),
        backgroundColor: kShrineSurfaceWhite,
        body: Stack(
          children: [
            Container(
              color: kShrinePink50,
              height: double.infinity,
              width: 180,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 100),
              child:   AnimatedBuilder(
                animation: animation,
                builder: (ctx, s){
                  return Transform.rotate(
                    angle: animation.value  * math.pi / 180,
                    child:
                    Container(
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

            Container(
              color: kShrineErrorRed,
              width: double.infinity,
              height: 100,
            ),
            Positioned(
                width: 180,
                height: Get.height,
                top: 100,
                left: 180,
                child: Container(
                  color: kDefaultIconLightColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleNumber("1"),
                          CircleNumber("2"),
                          CircleNumber("3"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleNumber("4"),
                          CircleNumber("5"),
                          CircleNumber("6"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleNumber("7"),
                          CircleNumber("8"),
                          CircleNumber("9"),
                        ],
                      ),
                      IconButton(onPressed: startAnimation, icon: Icon(Icons.add)),
                      AnimatedRotation(
                        turns: rotation,
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CircleNumber("7"),
                              ),
                            ]),
                      ),

                      // GestureDetector(
                      //   onPanUpdate: _onPanUpdateHandler,
                      //   child: Transform.rotate(
                      //       angle: angle,
                      //       child:
                      //       SvgPicture.asset(
                      //           'assets/ic_turbine.svg',
                      //         //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      //           semanticsLabel: 'A red up arrow'
                      //       ),
                      //   ),
                      // ),



                      // AnimatedBuilder(
                      //   animation: animation,
                      //   builder: (c,s){
                      //     return CustomPaint(
                      //       //side, radius, radians
                      //       painter: ShapePainter(_sides,300, animation.value),
                      //       child:
                      //       SvgPicture.asset(
                      //           'assets/ic_turbine.svg',
                      //           colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      //           semanticsLabel: 'A red up arrow'
                      //       ),
                      //
                      //     );
                      //   },
                      // ),




                      Slider(
                        value: _sides,
                        min: 3.0,
                        max: 10.0,
                        label: _sides.toInt().toString(),
                        divisions: 7,
                        onChanged: (value) {
                          setState(() {
                            _sides = value;
                          });
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
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
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
    Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
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
