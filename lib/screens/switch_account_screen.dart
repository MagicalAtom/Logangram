import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBackGroundColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/switch_account_background.png"),
                    )),
                  ),
                  Positioned(
                    top: 249,
                    child: ClipRect( // استفاده از این ویجت برای اینکه بک دراپ کل صفحه رو نگیره . 
                    // ویجت بک دراپ و چایلدش که قراره بلار بشه رو میندازیم تو این کلیپ رکت
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Image.asset("assets/images/profile.png"),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Mehran Piltan",
                                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: Theme.of(context).elevatedButtonTheme.style
                                  ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "switch account",
                                style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          height: 340,
                          width: 352,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromRGBO(255, 255, 255, .5),
                                    Color.fromRGBO(255, 255, 255, .2)
                                  ])),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 123,
                  bottom:
                      63), // برای هل دادن کانتینر بالاش به بالا و گرفتن جای بیش تر برای متن طبق طرح
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                "Dont Have an Account / ",
                style: TextStyle(fontFamily: 'gi', fontWeight: FontWeight.w600,color: Colors.white38),
              ),
              Text('Sign up',style: TextStyle(fontFamily: 'gi',fontWeight: FontWeight.w900,color: Colors.white),)

                ],

              )
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              repeat: ImageRepeat.repeat,
              opacity: .3,
              image: AssetImage('assets/images/pattern1.png')),
        ),
      ),
    );
  }
}
