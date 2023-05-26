import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/filter/filter_screen.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/product_card/product_card_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/categories_list_widget.dart';
import 'package:e_commerce/widget/home_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesScreen extends StatefulWidget {
  static const categoriesScreen = "/categoriesScreen";
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var rating = 0.0;
  bool view = false;
  void _toggleView() {
    setState(() {
      view = !view;
    });
  }

  List<HomeNewListModel> images1 = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/w_top4.png", "", 3, "10", "", "Mango",
        "Pullover", "", "15"),
    HomeNewListModel('1', "assets/images/w_top2.png", "", 2.5, "12", "",
        "Dorothy Perkins", "Blouse", "", "12"),
    HomeNewListModel('2', "assets/images/w_top3.png", "", 2, "8", "",
        "LOST Ink", "T-shirt", "", "18"),
    HomeNewListModel('3', "assets/images/w_top4.png", "", 3, "5", "", "Topshop",
        "Shirt", "", "30"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
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
                            ECToast.instance
                                .showError(context, "Comming soon...");
                            // bool isPop = await navigatorKeys[
                            //         Base.getCurrentTab(context)]!
                            //     .currentState!
                            //     .maybePop();
                            // if (!isPop) {
                            //   Base.switchTab(context, MyTabItem.home);
                            // }
                          },
                          child: SvgPicture.asset(
                            "assets/images/img_search.svg",
                          ),
                        )))),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Women’s tops",
                  style: TextStyle(fontSize: 34, color: AppColors.whiteColor),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, top: 12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Text("T-shirts"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Text("Crop tops"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Text("Sleeveless"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Text("Shirts"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 18),
              child: Container(
                height: 24,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterScreen()));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset("assets/icons/filter.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 11),
                                )
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: AppColors.backgroundColor,
                                    isDismissible: false,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25.0))),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return ScrollConfiguration(
                                          behavior: NoGlow(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Sort by",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    primary: false,
                                                    children: [
                                                      ListTile(
                                                        onTap: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: Text(
                                                          "Popular",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: Text(
                                                          "Newest",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: Text(
                                                          "Customer review",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: Text(
                                                          "Price: lowest to high",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        title: Text(
                                                          "Price: highest to low",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/swap.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Price: lowest to high",
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: _toggleView,
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Transform.scale(
                                  scale: 0.9,
                                  child: view
                                      ? SvgPicture.asset(
                                          'assets/icons/View_modules.svg',
                                          fit: BoxFit.cover,
                                          color: AppColors.white,
                                        )
                                      : SvgPicture.asset(
                                          'assets/icons/G_View.svg',
                                          fit: BoxFit.cover,
                                          color: AppColors.white,
                                        )),
                            ),
                          ),
                          // Container(
                          //   child: Image.asset("assets/icons/View.png"),
                          // ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (!view)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: images1.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductCardScreen()),
                            );
                          },
                          child: CategoriesListWidget(
                              homeNewListModel: images1[index]));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ),
            if (view)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 15),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    // physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: images1.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductCardScreen()),
                            );
                          },
                          child: HomeItemsGridListWidget(
                              homeNewListModel: images1[index]));
                    },
                  ),
                ),
              ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 14, top: 22),
            //   child: Expanded(
            //     child: GridView.builder(
            //     itemCount: images1.length,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 4.0,
            //         mainAxisSpacing: 4.0
            //     ),
            //     itemBuilder: (BuildContext context, int index){
            //       return HomeItemsListWidget(homeNewListModel:images1[index]);
            //     },
            //   )
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
