import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/shadowText.dart';
import 'landingPage.dart';
import 'navbar.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD0D5F1),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xffD0D5F1),
        child: AnimatedSplashScreen(
          duration: 4800,
          nextScreen: Navbar1(),
          splash: SplashScreenContent(),
          splashIconSize: 350,
          backgroundColor: Color(0xffD0D5F1),
          splashTransition: SplashTransition.slideTransition,
          animationDuration: Duration(seconds: 2),
        ),
      ),
    );
  }
}

class SplashScreenContent extends StatefulWidget {
  @override
  _SplashScreenContentState createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  // Declare a variable to hold the text visibility.
  bool _visible = false;

  @override
  void initState() {
    // Call a function after a delay of 3 seconds.
    Future.delayed(Duration(seconds: 2), () {
      // Set the _visible variable to true to show the text.
      setState(() {
        _visible = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD0D5F1),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.h,
              width: 200.w,
              child: AvatarGlow(
                startDelay: Duration(milliseconds: 1000),
                glowColor: Color(0xff686799),
                endRadius: 100.0,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  color: Colors.transparent,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 50.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                shape: BoxShape.circle,
                animate: true,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder(
              future: Future.delayed(Duration(seconds: 2)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 4000),
                    curve: Curves.easeInCirc,
                    child: Center(
                        child: Shimmer.fromColors(
                            child: ShadowText(
                                color: Color(0xff2F2D3A),
                                shadowColor: Color(0xff686799),
                                subtitle: "LIVE NEWS APP",
                                weight: FontWeight.w600,
                                size: 30),
                            baseColor: Color(0xff2F2D3A),
                            highlightColor: Color(0xff686799))),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
