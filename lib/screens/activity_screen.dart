/*
برای بررسی مواردی مثلا استاتوس یک عنصر اگه فلان بود بیاد اینشکلی نشون بده 
حالت هاش رو داخل  
enum 
ها ذخیره میکنیم 
سپس میایم و با سوییچ کیس مقادیر رو بررسی میکنیم
و طبق مقدار ها تغییرات رو اعمال میکنیم
*/

import 'package:flutter/material.dart';
import 'package:logangram/constant/constants.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  // with SlingleTickeProvider .... برای اینکه وی سینک تب کنترلر درست کار کنه
  TabController?
      tabController; //  کنترلر رو از نوع تب کنترلر ساخته و نالیبلش میکنیم
  /*
  نالیبل کردن روی نوع متغیر ها انجام میشه
  */

  /*
   کنترلری که بالا ساخته شد هم به تب بار داده میشه هم به تب بار ویو
  */

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 2, vsync: this); // ******* Most Important   *******
    // tabController   = TabController(length: تعداد تب های داخل صفحه, vsync: vsync)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainBackGroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: MainBackGroundColor,
                height: 80.0,
                child: TabBar(
                  // ساخت تب بار بالای صفحه
                  controller: tabController,
                  indicatorPadding: EdgeInsets.symmetric(
                      horizontal: 20), // کوچک شدن ایندیکیتور

                  labelStyle:
                      TextStyle(fontSize: 16, fontFamily: 'gi'), // استایل لیبل
                  indicatorWeight: 4, // عرض خط زیر تب
                  indicatorColor: ButtonBackGroundColor, // خط زیر تب فعال
                  tabs: [
                    Tab(
                      text: 'You',
                    ),
                    Tab(
                      text: 'Following',
                    ),
                    /*
                  هر تب یک کنترلر داره 
                  کنترلر تب ها برای اینکه بفهمیم کدوم تب انتخاب شده و کدوم محتوا رو بر اساس تب انتخاب شده باید خروجی بدیم
                  */
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                controller:
                    tabController, // واسه اینکه بفهمیم کدوم تب انتخاب شده
                children: [
                  // به ترتیب اولین بچه تب بار به اولین بجه تب بار ویو و به همین ترتیب تا آخر
                  // برای تب اول طبق کنترلر ==================================================
                  Padding(
                      padding: const EdgeInsets.only(left: 17, right: 14),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'New',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'gi'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _getActivityTop(),
                            SizedBox(
                              height: 20,
                            ),
                            _ToNewActivityList(),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Today',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'gi'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '1',name: 'mehran'),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '2',name: 'mohammad'),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '3',name: 'mahdieh'),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '4',name: 'massod'),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '5',name: 'nazanin'),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '6',name: 'mahmmod'),
                            SizedBox(
                              height: 20,
                            ),
                            _ThirdActivity(images: '7',name: 'mansooreh'),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),

                  // برای تب دوم نمایش داده میشه ===============================================
                  Container(
                    color: Colors.greenAccent,
                  )
                ],
              ))
            ],
          ),
        ));
  }

  Widget _ThirdActivity({required images,name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: ButtonBackGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(1000))),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: ButtonBackGroundColor, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/item$images.png',fit: BoxFit.cover,),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 7,
                ),
                Text('Started Following',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'gi',
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'you',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  '3 min',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'gi',
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, left: 17),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Follow"),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(50, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ],
    );
  }

  Widget _ToNewActivityList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: ButtonBackGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(1000))),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: 40,
          height: 40,
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'amirahmmadadibi',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 7,
                ),
                Text('Started Following',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'gi',
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'you',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  '3 min',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'gi',
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, left: 17),
          child: Container(
            width: 40,
            height: 40,
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _getActivityTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: ButtonBackGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(1000))),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: 40,
          height: 40,
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'amirahmmadadibi',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 7,
                ),
                Text('Started Following',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'gi',
                        color: Colors.white)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'you',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'gi',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  '3 min',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'gi',
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, left: 17),
          child: OutlinedButton(
            onPressed: () {},
            child: Text('Message'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontWeight: FontWeight.w400),
              side: BorderSide(
                color: Colors.white,
                width: 2,
              ),
              minimumSize: Size(40, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}
