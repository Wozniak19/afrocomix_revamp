import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      color: Colors.yellow.shade900,
    );
  }
}
