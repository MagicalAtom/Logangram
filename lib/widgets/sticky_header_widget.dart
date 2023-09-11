import 'package:flutter/material.dart';


class StickyHeader extends SliverPersistentHeaderDelegate {
  StickyHeader(this._tabBar);
  final TabBar _tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
  return Container(
    child:_tabBar // نوعش رو تب بار دادیم و پاس دادیم به این
  );
  }

  @override
  // TODO: implement maxExtent
  // بیش ترین سایزی هست که این استیکی هدر ما میتونه بگیره موقع اسکرول به بالا
  double get maxExtent => _tabBar.preferredSize.height + 10;

  @override
  // TODO: implement minExtent
  // این هم کاملا برعکس بالایی
  double get minExtent => _tabBar.preferredSize.height + 10;

  // این هم true باشه
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
  return true;
  }

}