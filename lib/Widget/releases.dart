import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Releases extends StatelessWidget {
  final bool isDark;
  const Releases({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.045),
      height: context.screenHeight * .2,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/batman.png",
              // height: 50,
              // width: 50,
            ).p12(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: double.maxFinite,
              width: double.maxFinite,
              child: "Batman 2 has now been released, check it out now"
                  .text
                  .fontWeight(FontWeight.w500)
                  .maxLines(2)
                  .overflow(TextOverflow.ellipsis)
                  .scale(.95)
                  .make(),
            ),
          ),
        ],
      ),
    );
  }
}
