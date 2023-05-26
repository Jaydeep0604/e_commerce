import 'package:flutter/material.dart';

enum MyTabItem { home, shop, bag, favourite, profile }

const Map<MyTabItem, String> tabName = {
  MyTabItem.home: 'home',
   MyTabItem.shop: 'shop',
  MyTabItem.bag: 'bag',
  MyTabItem.favourite: "favourite",
  MyTabItem.profile: "profile"
};

final navigatorKeys = {
  MyTabItem.home: GlobalKey<NavigatorState>(debugLabel: "home"),
  MyTabItem.shop: GlobalKey<NavigatorState>(debugLabel: "shop"),
  MyTabItem.bag: GlobalKey<NavigatorState>(debugLabel: "bag"),
  MyTabItem.favourite: GlobalKey<NavigatorState>(debugLabel: "favourite"),
  MyTabItem.profile: GlobalKey<NavigatorState>(debugLabel: "profile")
};

final globalNavigationKey = GlobalKey<NavigatorState>();
// const Map<MyTabItem, MaterialColor> activeTabColor = {
//   MyTabItem.red: Colors.red,
//   MyTabItem.green: Colors.green,
//   MyTabItem.blue: Colors.blue,
// };