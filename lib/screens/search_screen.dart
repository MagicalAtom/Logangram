import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainBackGroundColor,
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _SearchBox(),
            ),
            SliverToBoxAdapter(
              child: _Categories(),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(horizontal: 16),sliver:  SliverGrid(delegate:SliverChildBuilderDelegate((context, index) { // میتونیم مشخص کنیم که این چی بگیره و بهش پدینگ بده داخل اسلیور ها
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
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
            QuiltedGridTile(2,
                1), // واحدها اندازه خاص دارن موقع بازی با آنها متوجه خواهیم شد // اون درازه
            QuiltedGridTile(2, 2), // 2 تا در ستون کراس و 2 تا در عرض رو
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            // ClipRect() هر جا که یک ویجت داشت بیرون میزد
          ]),),)
           
          ],
        )));
  }
// ********************* Most important *********************
  // Widget _GenerateExplore() {
    // return GridView.custom(
    //   gridDelegate: SliverQuiltedGridDelegate(
    //       crossAxisCount: 3, // تعداد ستون ها
    //       crossAxisSpacing: 10, // محور عمودی
    //       mainAxisSpacing: 10, // محور افقی
    //       repeatPattern: QuiltedGridRepeatPattern
    //           .inverted, // وقتی کامل شد پترن رو برعکس دوباره بچین
    //       pattern: [
    //         // کراس اکسیس کانت برابر با محور عمودی
    //         // QuiltedGridTile(height کاشی, width کاشی),
    //         // تعداد این پترن ها باید به اندازه
    //         // CrossAxisCount بالا باشه
    //         // جنریت کردن کاشی ها در سلویر کوایلتدگریددلیگت و پر کردن محتوا آنها در سلویرچایلدبیلدردلیگیت
    //         QuiltedGridTile(2,
    //             1), // واحدها اندازه خاص دارن موقع بازی با آنها متوجه خواهیم شد // اون درازه
    //         QuiltedGridTile(2, 2), // 2 تا در ستون کراس و 2 تا در عرض رو
    //         QuiltedGridTile(1, 1),
    //         QuiltedGridTile(1, 1),
    //         QuiltedGridTile(1, 1),
    //         // ClipRect() هر جا که یک ویجت داشت بیرون میزد
    //       ]),
    //   childrenDelegate: SliverChildBuilderDelegate((context, index) {
    //     return Container(
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.transparent,
    //           image: DecorationImage(
    //               image: AssetImage("assets/images/item$index.png"),
    //               fit: BoxFit.cover)),
    //     );
    //   }, childCount: 9),
    // );


    
  }

  Widget _buildSearchScreen() {
    return Column(
      children: [
        _SearchBox(),
        SizedBox(
          height: 30,
        ),
        _Categories(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _Categories() {
      List<String> categories = [
    "All",
    "Account",
    "HashTag",
    "Caption",
    "Story",
    "Comments",
    "Date",
    "Group"
  ];
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Center(
                    child: Text(
                  categories[index],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff272b40),
                ),
              );
            },
          ),
        ),
          SizedBox(height: 30,)
      ],
    );
  }

  Container _SearchBox() {
    return Container(
      height: 46,
      margin: EdgeInsets.only(left: 14, right: 14, top: 10),
      decoration: BoxDecoration(
          color: Color(0xff272b40), borderRadius: BorderRadius.circular(13)),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            'assets/images/icon_search.png',
          ),
          hintText: 'Find Your Friend',
          suffixIcon: Image.asset("assets/images/icon_scan.png"),
          hintStyle: TextStyle(
            fontSize: 17,
            color: Color.fromRGBO(255, 255, 255, .9),
          ),
          focusedBorder: InputBorder.none, // زیر تکست فیلد موقع فوکوس نان باشه
        ),
      ),
    );
  }

