import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBackGroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Center(
             child: Container(
              width: 64,
              height: 64,
            child: Icon(CupertinoIcons.plus,color: ButtonBackGroundColor,size: 45,),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 2.5),
                borderRadius: BorderRadius.circular(17),
              ),
             ),
           ),
          ],
        ),
      ),

    );

  }
}