import 'dart:async';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For using SystemUiOverlayStyle
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/auth/login/screen/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _animationController!, curve: Curves.easeOut);
    _animationController!.forward();

    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
    );
    _animationController!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Container(
        decoration:   BoxDecoration(

          image: DecorationImage(
            image: AssetImage(ImagesApp.backgroundSplashScreen),
            // Replace with your asset
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: _animation!,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(ImagesApp.logoApp2, height: 300, width: 300)),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _animation!,
                child: const Text('اهلا بك', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              FadeTransition(
                opacity: _animation!,
                child: const Text('منصتي التعليمية', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
