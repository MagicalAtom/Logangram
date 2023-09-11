import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:logangram/constant/constants.dart';
import 'package:logangram/widgets/sticky_header_widget.dart';

/*
ویچت هایی مثل
AppBar - TabBar - ...
که حالتی پیشفرض از خودشون دارن رو میگن
PrefredSizedWidget
 */

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainBackGroundColor,
        body: DefaultTabController(
          length: 2, // استفاده از ویجت بالا یک روش دیگه برای دادن کنترلر به تب هاست
          // همین رو میزاریم و دیگه نمیخواد برای تب کنترلر از اینا تعریف کنیم
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              // isScrolled says this section scrolled or not
              return [
                /*
            SliverAppBar
            پایین برای مشخص کردن عکس بالای صفحه
             */
                SliverAppBar(
                  // بعد از اسکرول جمع نشه کامل یک ذره بمونه ازش
                  elevation: 4,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 17),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                              size: 40,
                            )),
                      ),
                    )
                  ],
                  bottom: PreferredSize(
                    // پایین میگه که از هایت 10 تا اندازه و وید نامحدود
                    preferredSize: Size.fromHeight(10),
                    // یک پارامتر اجباری به اسم سایز داره
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                          color: MainBackGroundColor,
                          // بک گراند ترنس پرنت نباید بدیم
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                    ), // همون کانتینر گوشه گرد
                  ),
                  // برای ساخت گوشه های گرد بالا در پایین این اپ بار
                  backgroundColor: MainBackGroundColor,
                  //  برای گرفتن پس زمینه آبی
                  expandedHeight: 200,
                  // اندازه کش اومدن اپ بار
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/images/item1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getUserInfo(),
                ),
                SliverPersistentHeader(
                  delegate: StickyHeader(
                TabBar(
                  padding: EdgeInsets.only(top: 20),
                      indicatorColor: ButtonBackGroundColor,
                      indicatorWeight: 5,

                      tabs: [
                        Tab(icon: Icon(Icons.collections),),
                        Tab(icon: Icon(Icons.collections_bookmark_outlined),),
                      ],
                    ),
                  ),// چون مقداری که میخواد نوع تب بار هست پس میاد به تب بار کست میشه
                  pinned: true, // به مین سایزش رسید پین بشه بالا
                  floating: true, // حالت جمع شدنش جالب باشه
                ),
                SliverPadding(padding: EdgeInsets.symmetric(vertical: 12))
              ];
            },
            body: TabBarView(

              children: [
             Container(
               color: MainBackGroundColor,
               child:  CustomScrollView(
                 slivers: [
                   SliverPadding(padding: EdgeInsets.symmetric(horizontal: 16),sliver:  SliverGrid(delegate:SliverChildBuilderDelegate((context, index) { // میتونیم مشخص کنیم که این چی بگیره و بهش پدینگ بده داخل اسلیور ها
                     return Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: MainBackGroundColor,
                           image: DecorationImage(
                               image: AssetImage("assets/images/item$index.png"),
                               fit: BoxFit.cover)),
                     );
                   }, childCount: 9), gridDelegate: SliverQuiltedGridDelegate(
                       crossAxisCount: 3, // تعداد ستون ها
                       crossAxisSpacing: 10, // محور عمودی
                       mainAxisSpacing: 10, // محور افقی
                       repeatPattern: QuiltedGridRepeatPattern
                           .inverted, // وقتی کامل شد پترن رو برعکس دوباره بچین
                       pattern: [
                         // کراس اکسیس کانت برابر با محور عمودی
                         // QuiltedGridTile(height کاشی, width کاشی),
                         // تعداد این پترن ها باید به اندازه
                         // CrossAxisCount بالا باشه
                         // جنریت کردن کاشی ها در سلویر کوایلتدگریددلیگت و پر کردن محتوا آنها در سلویرچایلدبیلدردلیگیت
                         QuiltedGridTile(1,
                             1), // واحدها اندازه خاص دارن موقع بازی با آنها متوجه خواهیم شد // اون درازه
                         QuiltedGridTile(2, 2), // 2 تا در ستون کراس و 2 تا در عرض رو
                         QuiltedGridTile(1, 1),
                         QuiltedGridTile(1, 1),
                         QuiltedGridTile(1, 1),
                         // ClipRect() هر جا که یک ویجت داشت بیرون میزد
                       ]),),)
                 ],
               ),
             ),
                Expanded(child: Container(color:MainBackGroundColor,)),
              ],
            ), // محتوای تب ها یا همان TabView ها اینجا قرار میگیرد
          ),
        ));
  }

  Widget _getUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 70.0,
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 66.0,
                height: 66.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'))),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: ButtonBackGroundColor, width: 2.5),
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'امیر احمد برنامه نویس موبایل',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'amirahmmadadibi',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.pencil_ellipsis_rectangle,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
    );
  }
}
