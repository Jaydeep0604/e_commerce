import 'package:e_commerce/navigator/bootom_nav.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/navigator/tab_navigator.dart';
import 'package:flutter/material.dart';
class Base extends StatefulWidget {
  static const String base = "/base";
  const Base({Key? key}) : super(key: key);
  static getCurrentTab(BuildContext context) {
    _BaseState? state = context.findAncestorStateOfType<_BaseState>();
    return state?._currentTab;
  }

  static switchTab(BuildContext context, MyTabItem myTabItem) {
    _BaseState? state = context.findAncestorStateOfType<_BaseState>();
    state?._selectTab(myTabItem);
  }

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  late GlobalKey<ScaffoldState> globalScaffoldKey;
  // late UserStateContainerState userState;
  

  openDrawer() {
    globalScaffoldKey.currentState?.openDrawer();
  }

  getCurrentTab() {
    return _currentTab;
  }

  @override
  void initState() {
    globalScaffoldKey = GlobalKey<ScaffoldState>();
    
  }

  var _currentTab = MyTabItem.home;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != MyTabItem.home) {
            _selectTab(MyTabItem.home);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // drawer: AvmDrawer(),
        key: globalScaffoldKey,
        body: Stack(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height -
              //     kBottomNavigationBarHeight +
              //     10,
              child: MyTabItem.home == _currentTab
                  ? _buildOffstageNavigator(MyTabItem.home)
                  : MyTabItem.shop == _currentTab
                      ? _buildOffstageNavigator(MyTabItem.shop)
                      : MyTabItem.bag == _currentTab
                          ? _buildOffstageNavigator(MyTabItem.bag)
                          : MyTabItem.favourite == _currentTab
                              ? _buildOffstageNavigator(MyTabItem.favourite)
                              : _buildOffstageNavigator(MyTabItem.profile),
            ),
          ],
        ),
        // extendBody: true,
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(MyTabItem tabItem) {
    bool isOffset = _currentTab != tabItem;
    return TabNavigator(
      navigatorKey: navigatorKeys[tabItem]!,
      tabItem: tabItem,
    );
  }

  void _selectTab(MyTabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      // navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
      setState(() => _currentTab = tabItem);
    }
  }
}
