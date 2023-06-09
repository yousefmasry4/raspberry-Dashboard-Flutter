import 'package:car_dashbord/components/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

import 'components/car_indicators.dart';
import 'components/current_speed.dart';
import 'components/gear_battery.dart';
import 'components/menu.dart';
import 'components/time_and_temp.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<double> speedLineOpacities = [1, 0.8, 0.6];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    constraints: const BoxConstraints(
                      maxWidth: 800,
                      maxHeight: 400,
                    ),
                    // alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TimeAndTemp(constraints: constraints),
                                Expanded(
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children:  [
                                              const SizedBox(width: 30),
                                              const CurrentSpeed(speed: 220),
                                              const Spacer(),

                                               Stack(
                                                 children: [
                                                   const SizedBox(
                                                    height: 280,
                                                    width: 500,
                                                    child: const MapView(
                                                    ),
                                              ),

                                                   Container(
                                                     height: 280,
                                                     width: 500,
                                                     decoration:  BoxDecoration(
                                                         gradient: RadialGradient(
                                                              center: Alignment.center,
                                                              radius: 0.99,
                                                              colors: [Colors.transparent,Colors.black.withOpacity(0.4), Colors.black],
                                                              stops: [0.4,0.8, 0.9],
                                                           tileMode: TileMode.clamp
                                                         )
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                            ],
                                          ),
                                          GearAndBattery(
                                              constraints: constraints),
                                        ],
                                      ),
                                      ...List.generate(
                                        speedLineOpacities.length,
                                        (index) => Positioned(
                                          bottom: 20 + (2 * index).toDouble(),
                                          left:
                                              (30.0 * index),
                                          height: constraints.maxHeight ,
                                          width: constraints.maxWidth * 0.31,
                                          child: Opacity(
                                            opacity: speedLineOpacities[index],
                                            child: CustomPaint(
                                              painter: SpeedLinePainter(),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Spacer(),
                                  Container(
                                    width: 220,
                                    height: 310,
                                     child: const MyMenu(),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}




class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_0.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_0.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_0.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_0.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2325310, size.height * 0.1075232),
        Offset(size.width * 0.05690000, size.height * 0.3567081),
        [const Color(0xff6B4339).withOpacity(1), const Color(0xff8B7268)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_1.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_1.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_1.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_1.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.radial(
      const Offset(0, 0),
      size.width * 0.001769912,
      [
        const Color(0xffE2BDAD).withOpacity(0.85),
        const Color(0xffE2BDAD).withOpacity(0),
      ],
      [0, 1],
    );
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_2.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_2.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_2.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_2.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
        Offset(size.width * 1.251189, size.height * 1.259853),
        Offset(size.width * 0.1584545, size.height * 0.01942938), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff6B4339).withOpacity(0)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AverageMillagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.28, size.height * 0);
    path_0.lineTo(size.width, size.height * 0.00);
    path_0.lineTo(size.width * 0.295, size.height * 0.086);
    path_0.lineTo(size.width * 0.00, size.height * 0.98);
    path_0.lineTo(size.width * 0.28, size.height * 0.00);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9125874, size.height * -0.000008129217),
        Offset(size.width * 0.8369860, size.height * 1.762893), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff7D7472).withOpacity(0.79)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GearPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF52342C)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
    const double strokeWidth = 2;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.17, size.height * 0.5);
    path.lineTo(size.width * 0.34, size.height * 0.5);
    path.lineTo(size.width * 0.42, 0);
    path.lineTo(size.width * 0.48, 0);
    path.lineTo(size.width * 0.48, strokeWidth);
    path.lineTo(size.width * 0.42, strokeWidth);
    path.lineTo(size.width * 0.34, size.height * 0.5 + strokeWidth);
    path.lineTo(size.width * 0.17, size.height * 0.5 + strokeWidth);
    // path.moveTo(size.width * 0.52, 0);

    path.close();
    canvas.drawPath(path, paint);

    Path path2 = Path();
    path2.moveTo(size.width * 0.5, 0);
    path2.lineTo(size.width * 0.58, 0);
    path2.lineTo(size.width * 0.66, size.height * 0.5);
    path2.lineTo(size.width * 0.83, size.height * 0.5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width * 0.83, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.66, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.58, strokeWidth);
    path2.lineTo(size.width * 0.52, strokeWidth);

    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DashLinePainter extends CustomPainter {
  final double progress;

  DashLinePainter({required this.progress});

  final Paint _paint = Paint()
    ..color = const Color(0xFF52342C)
    ..strokeWidth = 10.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * progress, size.height / 2);

    Path dashPath = Path();

    double dashWidth = 24.0;
    double dashSpace = 2.0;
    double distance = 0.0;

    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(DashLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class SpeedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double stockWidth = 8;
    Path path_0 = Path()
      ..moveTo(size.width * 0.76, 0)
      ..lineTo(size.width, size.height * 0.30)
      ..lineTo(size.width - stockWidth, size.height * 0.30)
      ..close();

    Path path1 = Path()
      ..moveTo(size.width, size.height * 0.30)
      ..lineTo(40, size.height - 20)
      ..lineTo(size.width - stockWidth, size.height * 0.30)
      ..close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9125874, size.height * -0.000008129217),
        Offset(size.width * 0.8369860, size.height * 1.762893), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff7D7472).withOpacity(0.79)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
    canvas.drawPath(path1, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
