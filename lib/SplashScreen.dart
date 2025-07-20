import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(

      duration: const Duration(seconds: 15),
      vsync: this)..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.push(context,
            MaterialPageRoute(builder: (context)=>const LoginScreen())));

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash screen.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation:_controller ,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: const Center(
                        child: Image(
                          image: AssetImage("assets/images/recipe2.png"),
                        ),
                      ),
                    ),
                    builder:(BuildContext context, Widget? child ){
                      return Transform.rotate(
                        angle:_controller.value*2.0*math.pi,
                        child: child,
                      );
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
