import 'package:e_commerce/navigator/routes.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
  static const String detail1 = '/detail1';
  static const String detail2 = '/detail2';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final MyTabItem tabItem;

  // void _push(BuildContext context, {int materialIndex: 500}) {
  //   var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               routeBuilders[TabNavigatorRoutes.detail]!(context)));
  // }

//  Map<int, Widget> routeName = {
//       0: HomePage(title: "This home"),
//       1: OfferBusiness(),
//       2: AddNewBusinessPage(),
//       3: OfferListPage(),
//       4: ProfilePage()
//     };
  // Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
  //     {int materialIndex: 500}) {
  //   return {
  //     // TabNavigatorRoutes.root: (context) => HomePage(title: "Home Page"),
  //     TabNavigatorRoutes.root: (context) => routeName[tabItem.index]!,
  //     TabNavigatorRoutes.detail: (context) => ColorDetailPage(
  //           color: Colors.yellow,
  //           title: tabItem.toString(),
  //           materialIndex: materialIndex,
  //         ),
  //     TabNavigatorRoutes.detail1: (context) => ColorDetailPage(
  //           color: Colors.green,
  //           title: tabItem.toString(),
  //           materialIndex: materialIndex,
  //         ),
  //     TabNavigatorRoutes.detail2: (context) => ColorDetailPage(
  //           color: Colors.green,
  //           title: tabItem.toString(),
  //           materialIndex: materialIndex,
  //         ),
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    // var routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: '/',

      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => ECRoutes.generateRoute(context, tabItem.index,
              routeSettings)[routeSettings.name]!(context),
          settings: routeSettings,
        );
      },
    );
  }
}
