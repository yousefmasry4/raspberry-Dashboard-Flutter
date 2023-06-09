import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarIndicators extends StatefulWidget {
  final bool highlighted ;
  final bool leftIndicator ;
  final bool rightIndicator ;
  final bool headLight ;

  const CarIndicators({
    Key? key,
    required this.highlighted,
    required this.leftIndicator,
    required this.rightIndicator,
    required this.headLight,
  }) : super(key: key);

  @override
  State<CarIndicators> createState() => _CarIndicatorsState();
}

class _CarIndicatorsState extends State<CarIndicators> {
  bool _leftIndicator=false ;
  bool _rightIndicator=false ;
  @override
  void initState() {
    super.initState();
    /// time to increase the counter every second
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        if(widget.leftIndicator){
          _leftIndicator = !_leftIndicator ;
        }
        if(widget.rightIndicator){
          _rightIndicator = !_rightIndicator ;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/icons/left_indicator.svg",
            height: 32,
            color: widget.leftIndicator && _leftIndicator ? Colors.green : Colors.grey.withOpacity(0.5),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/icons/head_light.svg",
            height: 32,
            color: widget.headLight ? Colors.white : Colors.grey.withOpacity(0.4),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/icons/dipper.svg",
            height: 32,
            color: widget.highlighted ? Colors.white : Colors.grey.withOpacity(0.4),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "assets/icons/right_indicator.svg",
            height: 32,
            color: widget.rightIndicator && _rightIndicator ? Colors.green : Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
