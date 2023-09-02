import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool likeButtonState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset('assets/images/icon_direct.png')],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: 120,
          child: Image.asset(
            'assets/images/moodinger_logo.png',
            width: 100,
          ),
        ),
      ),
      backgroundColor: MainBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            SizedBox(
              height: 120,
              width: 500,
              child: _storyList(),
            ),
        _HomePageCreation()

            ],
          ),
        ),
      ),
    );
  }

  Widget _storyList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Expanded(
          child: Column(
            children: [
              index == 0 ? _getUploadOwnStory() : _getFriendStory(story: true),
            ],
          ),
        );
      },
    );
  }

  Widget _HomePageCreation() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 29,
              ),
              _getPostOwnerInfo(),
              SizedBox(
                height: 23,
              ),
              _getPost()
            ],
          ),
        );
      },
    );
  }

  Container _getPost() {
    return Container(
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
              top: 0,
              child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      likeButtonState = likeButtonState ? false : true;
                    });
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                      child: Image.asset('assets/images/post_cover.png')))),
          Positioned(
            child: Icon(
              CupertinoIcons.play_rectangle_fill,
              color: Colors.white,
              size: 28,
            ),
            top: 15,
            right: 10,
          ),
          Positioned(
            bottom: 15,
            child: Container(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, .5),
                            Color.fromRGBO(255, 255, 255, .2),
                          ]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: double.infinity,
                            ),
                            likeButtonState
                                ? LikeButton()
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        likeButtonState =
                                            likeButtonState ? false : true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.heart_broken,
                                      size: 34,
                                      color: Colors.white,
                                    )),
                            SizedBox(
                              width: likeButtonState == true ? 5 : 0,
                            ),
                            Text(
                              likeButtonState == true ? "214" : "213",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: 'gi'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/icon_comments.png"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "1.5K",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: 'gi'),
                            ),
                          ],
                        ),
                        Image.asset("assets/images/icon_share.png"),
                        Image.asset("assets/images/icon_save.png"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            width: 340,
            height: 46,
          )
        ],
      ),
    );
  }

  Widget LikeButton() {
    return InkWell(
      child: Image.asset(
        'assets/images/icon_hart.png',
        width: 33,
      ),
      onTap: () {
        setState(() {
          likeButtonState = likeButtonState == true ? false : true;
        });
      },
    );
  }

  Widget _getPostOwnerInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getFriendStory(nonePattern: true, normalImageSize: false),
        SizedBox(
          width: 13,
        ),
        Column(
          children: [
            Text(
              "amirahmadAdibi",
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'gi'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text("Mobile Developer",
                  style: TextStyle(
                      color: ButtonBackGroundColor,
                      fontSize: 12.2,
                      fontFamily: 'gi')),
            ),
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.ellipsis_vertical,
              size: 24,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget _getFriendStory({
    bool nonePattern = false,
    bool normalImageSize = true,
    bool story = false,
  }) {
    double imagesize = normalImageSize == true ? 6 : 4.5;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          children: [
            DottedBorder(
              color: ButtonBackGroundColor,
              strokeWidth: 2,
              dashPattern: nonePattern ? [50, .1221] : [22, 4],
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(imagesize),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Container(
                  height: story == true ? 64 : 45,
                  width: story == true ? 64 : 45,
                  child: Container(
                    width: story == true ? 60 : 40,
                    height: story == true ? 64 : 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/profile.png"))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Adibi",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'gi',
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            )
          ],
        ));
  }

  Widget _getUploadOwnStory() {
    return Container(
      margin: EdgeInsets.only(top: 4, right: 7),
      child: Column(
        children: [
          Container(
            width: 77,
            height: 77,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(17)),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: MainBackGroundColor,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Image.asset('assets/images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Your Story",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'gi',
                fontWeight: FontWeight.bold,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}
