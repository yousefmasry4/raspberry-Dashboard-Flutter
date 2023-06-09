import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'car_indicators.dart';

class TimeAndTemp extends StatefulWidget {
  const TimeAndTemp({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  State<TimeAndTemp> createState() => _TimeAndTempState();
}

class _TimeAndTempState extends State<TimeAndTemp> {
  String? timeNow;
  @override
  void initState() {
    super.initState();
    /// time to increase the counter every second
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        timeNow = DateFormat('hh:mm a').format(DateTime.now());
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: widget.constraints.maxHeight * 0.11,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleMedium!,
        child: Row(
          children: [
             Text(timeNow ?? ""),
            const Spacer(),
            const CarIndicators(
              headLight: true,
              highlighted: false,
              leftIndicator: true,
              rightIndicator: true,
            ),
            const Spacer(),
            SvgPicture.asset(
              "assets/icons/sun.svg",
              height: 32,
            ),
            const SizedBox(width: 4),
            const Text("18 °C"),


          ],
        ),
      ),
    );
  }
}
