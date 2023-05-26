import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/shop/choose_category/all_category_screen.dart';
import 'package:e_commerce/ui/shop/kidscreen.dart';
import 'package:e_commerce/ui/shop/menscreen.dart';
import 'package:e_commerce/ui/shop/womenscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseCategoriesScreen extends StatefulWidget {
  static const chooseCategoriesScreen = "/chooseCategoriesScreen";
  const ChooseCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCategoriesScreen> createState() => _ChooseCategoriesScreenState();
}

class _ChooseCategoriesScreenState extends State<ChooseCategoriesScreen>
    with SingleTickerProviderStateMixin {
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
                    isNeedCenterTitle: "Categories",
                    isNeedLeading: false,
                    isNeedProfile: true,
                    leadingIcon: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                          child: SvgPicture.asset(
                            "assets/images/img_arrowleft.svg",
                          ),
                        ),
                      ),
                    ),
                    action: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllCategoryScreen()));
                          },
                          child: SvgPicture.asset(
                            "assets/images/img_search.svg",
                            
                          ),
                        )))),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.greyColor,
                automaticIndicatorColorAdjustment: true,
                controller: controller,
                indicatorWeight: 4,
                labelStyle: Theme.of(context).textTheme.headline6?.copyWith(),
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(
                        "Women",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // text: "Men",
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        "men",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        "Kid",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: controller, children: [
        WomenScreen(),
        MenScreen(),
        KidScreen(),
      ]),
    );
  }
}
