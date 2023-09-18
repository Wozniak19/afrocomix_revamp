import 'package:afrocomix/utils/classes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GenreTile extends StatelessWidget {
  const GenreTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.21,
      width: context.screenWidth,
      // color: Colors.red,
      child: ListView.builder(
        itemCount: allGenres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: context.screenHeight * 0.013),
            child: InkWell(
              splashColor: allGenres[index].color.withOpacity(.5),
              onTap: () {},
              borderRadius: BorderRadius.circular(9),
              child: SizedBox(
                height: context.screenHeight * 1.3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: context.screenHeight * 0.07,
                        backgroundColor: allGenres[index].color.withOpacity(.2),
                        child: Center(
                          child: Icon(
                            allGenres[index].icon,
                            size: 40,
                            color: allGenres[index].color,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    allGenres[index].name.text.semiBold.scale(1.1).make(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
