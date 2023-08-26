import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';
import 'package:logangram/screens/home_screen.dart';
import 'package:logangram/screens/login_screen.dart';
// import 'package:logangram/screens/switch_account_screen.dart';

void main() => runApp(LoganGram());

class LoganGram extends StatelessWidget {
  const LoganGram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(129, 46),
          backgroundColor: ButtonBackGroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)), // گرد کردن دور باتن
          elevation: 0,
          textStyle: TextStyle(fontFamily: 'gi',fontWeight: FontWeight.w700,fontSize: 16),
        ),
      )),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBackGroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pattern1.png'),
              repeat: ImageRepeat.repeat,
              opacity: .3),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/logo_splash.png",
                  width: 155.0,
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  Text(
                    "From",
                    style: TextStyle(
                        color: Color(0xffc5c5c5),
                        fontFamily: 'gi',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "MagicSoftWare",
                    style: TextStyle(
                        color: Colors.blue[300],
                        fontFamily: 'gi',
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              bottom: 32,
            ),
          ],
        ),
      ),
    );
  }
}
