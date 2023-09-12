import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';
import 'package:logangram/screens/activity_screen.dart';
import 'package:logangram/screens/home_screen.dart';
import 'package:logangram/screens/search_screen.dart';
import 'package:logangram/screens/upload_post.dart';
import 'package:logangram/screens/user_page_screen.dart';

/*
این صفحه رو ساختیم تا یک باتم نویگیشن یکتا داشته باشیم و با استفاده از اون بین صفحات جابهجا بشیم
 */
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _TabState = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // برای اینکه باتم نویگیشن رو گرد کنیم این کار رو کردیم
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(17), topLeft: Radius.circular(17))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight:Radius.circular(17), topLeft: Radius.circular(17)),
          child: BottomNavigationBar(
            currentIndex: _TabState,
            // ایندکس تب انتخاب شده رو برمیگردونه
            onTap: (int index) {
              setState(() {
                _TabState = index;
              });
            },

            selectedItemColor: ButtonBackGroundColor,
            // رنگ مورد انتخاب شده

            backgroundColor: MainBackGroundColor,
            showSelectedLabels: false,
            // نمایش ندادن لیبل مقدار انتخاب شده
            showUnselectedLabels: false,
            // نمایش ندادن لیبل مقدار انتخاب نشده
            // تمامی موارد انتخاب شده و انتخاب نشده رو میشه تغییر داد اینجا
            type: BottomNavigationBarType.fixed,
            // برای اینکه رنگ داده شده به باتم نویگیشن بار دیده بشه مقدارش رو فیکسد میکنیم
            items: [
              BottomNavigationBarItem(
                  activeIcon: Image.asset('assets/images/icon_active_home.png'),
                  // این برای مشخص کردن موقع اکتیو بودن
                  icon: Image.asset('assets/images/icon_home.png'),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                      'assets/images/icon_search_navigation_active.png'),
                  icon: Image.asset('assets/images/icon_search_navigation.png'),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon:
                      Image.asset('assets/images/icon_add_navigation_active.png'),
                  icon: Image.asset('assets/images/icon_add_navigation.png'),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                      'assets/images/icon_activity_navigation_active.png'),
                  icon: Image.asset('assets/images/icon_activity_navigation.png'),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: ButtonBackGroundColor, width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
      body: Center(
          child: IndexedStack(
              index: _TabState,
              // برای نمایش دادن صفحه . همه صفحات رو نگه میداره ایندکسی که اینجا هست میره روی همه ایندکس ها
              children:
                  generateLayOut() // خروجی این تابعی که قرار دادیم یک آرایه با مقادیر ویجت هست دیگه
              )),
    );
  }

/*
متد پایین برای جنریت کردن ویو ها
 */
  List<Widget> generateLayOut() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      UploadPost(),
      ActivityPage(),
      UserPage()
    ];
  }
}
