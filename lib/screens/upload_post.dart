import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logangram/constant/constants.dart';

class UploadPost extends StatelessWidget {
  const UploadPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
        color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Draft",style: TextStyle(color: ButtonBackGroundColor,fontFamily: 'gi',fontWeight: FontWeight.w800),),
          Text("Gallery",style: TextStyle(color: Colors.white,fontFamily: 'gi',fontWeight: FontWeight.w800),),
          Text("Take",style: TextStyle(color: Colors.white,fontFamily: 'gi',fontWeight: FontWeight.w800),)
        ]),
      ),
      backgroundColor: MainBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter( // این ویجت موقع اسکرول ثابت باقی میماند
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Post",
                          style: TextStyle(color: Colors.white, fontSize: 21,fontFamily: 'gi',fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 24,
                          color: Colors.white,
                          
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Icon(
                          Icons.navigate_next_sharp,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 25),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    // محتوا سلول ها
                    // میتونیم مشخص کنیم که این چی بگیره و بهش پدینگ بده داخل اسلیور ها
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: AssetImage("assets/images/item$index.png"),
                              fit: BoxFit.cover)),
                    );
                  }, childCount: 9),
                  gridDelegate: SliverQuiltedGridDelegate(
                      // چینش سلول ها
                      crossAxisCount: 3, // تعداد ستون ها
                      crossAxisSpacing: 6, // محور عمودی
                      mainAxisSpacing: 6, // محور افقی
                      pattern: [
                        // کراس اکسیس کانت برابر با محور عمودی
                        // QuiltedGridTile(height کاشی, width کاشی),
                        // تعداد این پترن ها باید به اندازه
                        // CrossAxisCount بالا باشه
                        // جنریت کردن کاشی ها در سلویر کوایلتدگریددلیگت و پر کردن محتوا آنها در سلویرچایلدبیلدردلیگیت

                        QuiltedGridTile(3, 3),  // بزرگه بالا 3 تا در 3 تا جا میگیره 3 تا در ستون 3 تا در سطر
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        // ClipRect() هر جا ک ه یک ویجت داشت بیرون میزد
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
