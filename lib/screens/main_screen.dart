import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';

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
      backgroundColor: MainBackGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _TabState,
        // ایندکس تب انتخاب شده رو برمیگردونه
        onTap: (int index) {
          setState(() {
            _TabState = index;
          });
        },
        selectedItemColor: ButtonBackGroundColor,
        // رنگ مورد انتخاب شده
        backgroundColor: Colors.grey,
        showSelectedLabels: false,
        // نمایش ندادن لیبل مقدار انتخاب شده
        showUnselectedLabels: false,
        // نمایش ندادن لیبل مقدار انتخاب نشده
        // تمامی موارد انتخاب شده و انتخاب نشده رو میشه تغییر داد اینجا
        type: BottomNavigationBarType.fixed,
        // برای اینکه رنگ داده شده به باتم نویگیشن بار دیده بشه مقدارش رو فیکسد میکنیم
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ''),
        ],
      ),
      body: Center(
        child: generateLayOut().elementAt(_TabState),
      ),
    );
  }



/*
متد پایین برای جنریت کردن ویو ها
 */
  List<Widget> generateLayOut(){
    return <Widget>[
      Container(color: Colors.red,),
      Container(color: Colors.green,),
      Container(color: Colors.yellow,),
      Container(color: Colors.blue,),
    ];
  }
}
