import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode textField = FocusNode();
  FocusNode textField2 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textField.addListener(() {
      setState(() {});
    });
    textField2.addListener(() {
      setState(() {});
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainBackGroundColor,
      body: SafeArea(
          child: Stack(
        // برای روی هم چیدن عناصر
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _TopImage(),
          Positioned(
              top: 0, left: 0, right: 0, bottom: 40, child: _BottomContainer()),
        ],
      )),
    );
  }

  Widget _TopImage() {
    return Column(
      children: [
        Expanded(
            child: Container(
          child: Image.asset('assets/images/rocket.png'),
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ])),
        )),
        Expanded(
            child: Container(
          child: null,
        )) // چون هر کدوم یک خالی در جایگاه رو به رویی دارن . بالا برای پایین و پایین برای بالا . این ها جای خالی ها رو پر میکنن هر کدوم
      ],
    );
  }

// تعریف 2 کالمن که یکی بالاش خالیه یکی پایینش اینارو تو استک قرار دادیم تا روی هم قراره بگیره
  Widget _BottomContainer() {
    return Column(
      children: [
        Expanded(
            child: Container(
          child: null,
        )),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: MainBackGroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: [
              SizedBox(
                height: 51,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign in to",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/mood.png',
                      width: 102,
                      height: 25,
                    ),
                    padding: EdgeInsets.only(top: 1.9),
                  ),
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Padding(
                // decrease TextField Size put textField To Padding widget
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  focusNode: textField2,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'gi',
                  ),
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'gi',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        color: textField2.hasFocus
                            ? Color(0xffF35383)
                            : Colors.white,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                      focusedBorder: OutlineInputBorder(
                        // TextField Border
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: ButtonBackGroundColor, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // TextField Border
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: GrayColor, width: 3),
                      )),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                // decrease TextField Size put textField To Padding widget
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  focusNode: textField,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'gi',
                  ),
                  decoration: InputDecoration(
                      
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'gi',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        color: textField.hasFocus
                            ? Color(0xffF35383)
                            : Colors.white,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 17),
                      focusedBorder: OutlineInputBorder(
                        // TextField Border
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: ButtonBackGroundColor, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // TextField Border
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: GrayColor, width: 3),
                      )),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textField.dispose();
    textField2.dispose();
  }
}
