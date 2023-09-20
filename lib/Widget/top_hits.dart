import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/classes.dart';

class TopHits extends StatelessWidget {
  final bool isDark;
  const TopHits({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.25,
      width: context.screenWidth,
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return hitCard(item: items[index], index: index, context: context);
          }),
    );
  }

  Widget hitCard({required CardItem item, required int index, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.screenHeight * 0.02, horizontal: 10),
      width: context.screenWidth * 0.8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: Colors.transparent),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade800.withOpacity(.6) : Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.photo,
                  size: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade700.withOpacity(.7) : Colors.grey.shade500.withOpacity(.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        item.title.text.semiBold.align(TextAlign.left).scale(1.1).make(),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.check_circle_outline_rounded,
                            size: 15,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    "# ${index + 1} comic in 2022".text.scale(.9).make()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
