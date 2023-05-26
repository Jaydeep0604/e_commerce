import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/myorder/cancelled_screen.dart';
import 'package:e_commerce/ui/myorder/delivered_screen.dart';
import 'package:e_commerce/ui/myorder/processing_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  static const myOrderScreen = "/myOrderScreen";
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  bool cancelled = true;
  bool processing = true;
  bool delivered = true;
  late TabController controller;
  int tabIndex = 0;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
    controller.addListener(() {
      setState(() {
        tabIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWithBottom(
        context: context,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppContent(
                    isNeedCenterTitle: "",
                    isNeedLeading: false,
                    isNeedProfile: true,
                    leadingIcon: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () async {
                            bool isPop = await navigatorKeys[
                                    Base.getCurrentTab(context)]!
                                .currentState!
                                .maybePop();
                            if (!isPop) {
                              Base.switchTab(context, MyTabItem.home);
                            }
                          },
                          child: Image.asset(
                            "assets/icons/back_icon.png",
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    action: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () async {
                            // bool isPop = await navigatorKeys[
                            //         Base.getCurrentTab(context)]!
                            //     .currentState!
                            //     .maybePop();
                            // if (!isPop) {
                            //   Base.switchTab(context, MyTabItem.home);
                            // }
                            ECToast.instance
                                .showError(context, "Comming soon...");
                          },
                          child: Image.asset(
                            "assets/icons/search_icon.png",
                            width: 20,
                          ),
                        )))),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Orders",
                  style: TextStyle(fontSize: 34, color: AppColors.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 30,
              child: TabBar(
                labelColor: AppColors.backgroundColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: AppColors.white,
                controller: controller,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.white),
                tabs: [
                  Tab(
                    height: 30,
                    child: Text(
                      "Delivered",
                    ),
                  ),
                  Tab(
                    height: 30,
                    child: Text(
                      "Processing",
                    ),
                  ),
                  Tab(
                    height: 30,
                    child: Text(
                      "Cancelled",
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(controller: controller, children: [
              DeliveredScreen(),
              ProcessingScreen(),
              CancelledScreen()
            ]),
          ),
        ],
      ),
    );
  }
}
