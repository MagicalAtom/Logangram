import 'dart:ui';

import 'package:flutter/material.dart';

/*
توضیحات
CustomScrollView
SliverList

با SliverList 
و داخلش 
deligate 
میتونیم عین لیست ویو عمل کنیم
childCount 
داره برای تعداد عناصر




بعد یک 
SliverToBoxAdapter
هم داره برای سینگل چایلد قرار گرفتن داخل 
sliver: 
در
CustomScrollView

SliverToBoxAdapter
برای مواردی مثل باتن بالای این پروژه . همون باتن باتم شیت
*/

class BottomSheetHome extends StatelessWidget {
  const BottomSheetHome({required this.controller, super.key});
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // استفاده از بک دراپ فیلتر داخل کلیپ آر رکت
      // باعث میشه که روی کل بک گراند اعمال نشه
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
            // چایلد بک دراپ فیلتر تنها چیزیه که اگه بک دراپ فیلتر داخل کلیپ آر رکت باشه میاد و بلار میشه
            padding: EdgeInsets.only(left: 44, right: 44),
            color: Color.fromRGBO(255, 255, 255, .1),
            width: 300,
            child: _HomeBottomSheetContent()),
      ),
    );
  }

  Widget _HomeBottomSheetContent() {
    // return GridView.builder(
    //   controller: this.controller, // کنترلری که از درگبل اسکروبل شیت گرفتیم رو به این میدیم بالا تو کانستراکتور دریافتش کردیم
    //   itemCount: 140,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // مشخص کردن نحوه چینش عناصر
    //     crossAxisCount: 4, // در هر ردیف چند تا بچینه
    //     mainAxisSpacing: 20, // فاصله افقی بین ردیف ها
    //     crossAxisSpacing: 20, // فاصله عمودی بین عناصر
    //   ),
    //   itemBuilder: (BuildContext context,index){
    //     return Container(
    //       color: Colors.red, // با کات کردن محور عمودی و افقی این ها سایز میگیرن دیگه
    //     );
    //   },
    // );

/*
اسلیور ها زیاد هستند یک نمونه هم برای گرید داره اسلیور گرید
شبیه به بالایی
پایین نمونه
*/

/*
اسلیور ها 
CustomScrollView
در دسترس هستند
*/

    return _BottomSheetHomeGenerator(controller: controller);
  }
}

class _BottomSheetHomeGenerator extends StatelessWidget {
  const _BottomSheetHomeGenerator({
    super.key,
    required this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Stack(

      alignment: Alignment.bottomCenter, // دکمه share رو وسط قرار بدیم
      children: [CustomScrollView(
        controller: controller, // مثل خود گرید ویو
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 67,
                  margin: EdgeInsets.only(top: 10, bottom: 22),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Center(
                    child: Container(
                      width: 30,
                      height: 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Share",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontFamily: 'gi'),
                    ),
                    Image.asset('assets/images/icon_share_bottomsheet.png'),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, .4),
                      borderRadius: BorderRadius.circular(13)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/icon_search.png'),
                      hintText: 'Find Your Friend',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(255, 255, 255, .9),
                      ),
                      focusedBorder:
                          InputBorder.none, // زیر تکست فیلد موقع فوکوس نان باشه
                    ),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
              ],
            ),
          ),
          SliverGrid(
            
            delegate: SliverChildBuilderDelegate(childCount: 56,(context, index) { // Sliver Child Builder Deligate for create child (SliverList and SliverGrid in CustomScrollView)
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/images/profile.png'),
                  ),
                  SizedBox(height: 5,),
                  Text("Hello",textAlign:TextAlign.center,style:TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'gi',
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // مشخص کردن نحوه چینش عناصر
              crossAxisCount: 4, // در هر ردیف چند تا بچینه
              mainAxisSpacing: 20, // فاصله افقی بین ردیف ها
              crossAxisSpacing: 20, // فاصله عمودی بین عناصر
              mainAxisExtent: 90 // فاصله دادیم تا با اضافه کردن اسم ها باتم اورفلو نشه
            ),
          ),
                SliverPadding(padding: EdgeInsets.only(top: 73)), // باعث این میشه که وقتی به آخر رسیدیم یک پدینگ بده که دکمه روی عناصر قرار نگیره

        ],
      ),
      Positioned(bottom: 30, child:ElevatedButton(onPressed: (){
      }, child: Text("Share"),style: Theme.of(context).elevatedButtonTheme.style,)),      
      ]
    );
  }
}
