import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({
    super.key,
     this.height,
     this.width,
    required this.color,
    required this.child,
  });

  final double? height;
  final double? width;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}