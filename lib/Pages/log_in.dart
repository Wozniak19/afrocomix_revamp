import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LogIn extends StatefulWidget {
  final bool isDark;
  const LogIn({super.key, required this.isDark});

  @override
  State<LogIn> createState() => _LogInState();
}

bool hidePassword = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
    emailController;
    passwordController;
  }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
  // void

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          SizedBox(
            height: context.screenHeight * 0.08,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15)),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    size: 15,
                    color: Colors.white,
                  ).box.red600.roundedSM.height(30).margin(const EdgeInsets.all(15)).width(30).alignCenter.make(),
                ),
              ],
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: widget.isDark ? Colors.white : Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: "Log in".text.scale(1.8).bold.color(widget.isDark ? Colors.white : Colors.black).make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: context.screenHeight * 0.065,
          // ),
          Image.asset("assets/Letiarts_Logo.png")
              .px12()
              .box
              .height(context.screenHeight * 0.37)
              .py8
              // .margin(EdgeInsets.symmetric(horizontal: 15))
              // .color(widget.isDark ? Colors.white : Colors.transparent)
              .linearGradient([
                widget.isDark ? Colors.white : Colors.transparent,
                widget.isDark ? Colors.white : Colors.transparent,
                // Colors.white,
                Colors.transparent,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              .alignCenter
              // .roundedSM
              .make(),
          SizedBox(
            height: context.screenHeight * 0.06,
          ),
          TextField(
            controller: emailController,
            cursorColor: !widget.isDark ? Colors.grey.shade900 : Colors.white,
            cursorRadius: const Radius.circular(9),
            cursorWidth: 1.57,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter email address",
              icon: Icon(
                Icons.email_outlined,
                color: widget.isDark ? Colors.white : Colors.grey.shade800,
              ),
              border: InputBorder.none,
            ),
          )
              .px24()
              .box
              .color(widget.isDark ? Colors.grey.shade900 : Colors.grey.shade200)
              .margin(const EdgeInsets.symmetric(horizontal: 15))
              // .shadowSm
              .rounded
              .make(),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: passwordController,
            cursorColor: !widget.isDark ? Colors.grey.shade900 : Colors.white,
            cursorRadius: const Radius.circular(9),
            cursorWidth: 1.57,
            keyboardType: TextInputType.visiblePassword,
            obscureText: hidePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () => setState(() {
                        hidePassword = !hidePassword;
                        print(hidePassword);
                      }),
                  icon: Icon(
                    hidePassword ? EvaIcons.eye : EvaIcons.eyeOff,
                    color: widget.isDark ? Colors.grey.shade200 : Colors.grey.shade900,
                  )),
              hintText: "Enter password",
              icon: Icon(
                Icons.lock_outline_rounded,
                color: widget.isDark ? Colors.white : Colors.grey.shade800,
              ),
              border: InputBorder.none,
            ),
          )
              .px24()
              .box
              .color(widget.isDark ? Colors.grey.shade900 : Colors.grey.shade200)
              .margin(const EdgeInsets.symmetric(horizontal: 15))
              // .shadowSm💜💜💜💜💜💜
              .rounded
              .make(),
          const SizedBox(
            height: 15,
          ),
          ZoomTapAnimation(
            // begin: .1,
            // end: 3.93,
            // endDuration: Duration(milliseconds: 11908),
            onTap: () {
              emailController.clear();
              passwordController.clear();
              // Navigator.pop(context);
            },
            child: "Log In"
                .text
                .bold
                .scale(1.4)
                .makeCentered()
                .animatedBox
                .height(context.screenHeight * 0.08)
                .width(context.screenWidth)
                .amber500
                .rounded
                .shadow2xl
                .shadowOutline(outlineColor: Colors.amber)
                .margin(const EdgeInsets.symmetric(horizontal: 15))
                .make(),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Or sign in with...".text.scale(.9).color(widget.isDark ? Colors.grey.shade300 : Colors.grey.shade900).make(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZoomTapAnimation(
                child: Image.asset(
                  "assets/Facebook-logo-removebg-preview.png",
                  height: 60,
                  width: 60,
                ),
              ),
              ZoomTapAnimation(
                child: Image.asset(
                  "assets/google-g-logo-removebg-preview.png",
                  height: 60,
                  width: 60,
                ),
              ),
              ZoomTapAnimation(
                child: Image.asset(
                  "assets/png-transparent-apple-logo-new-york-city-brand-computer-apple-company-computer-logo-removebg-preview.png",
                  height: 60,
                  width: 60,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
