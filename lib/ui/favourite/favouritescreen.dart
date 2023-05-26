import 'package:e_commerce/model/favourite_list_model.dart';
import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/filter/filter_screen.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/product_card/product_card_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/utils/route_transition.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/favourite_list_widget.dart';
import 'package:e_commerce/widget/home_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../widget/favss/fav_grid_list_widget.dart';

class FavouriteScreen extends StatefulWidget {
  static const favouriteScreen = "/favouritescreen";
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var rating = 0.0;
  bool view = false;
  void _toggleView() {
    setState(() {
      view = !view;
    });
  }

  bool like = false;
  // var rating = 0.0;
  void intState() {
    super.initState();
    liked();
  }

  void liked() {
    setState(() {
      like = !like;
    });
  }

  List<FavouriteListModel> images1 = [
    // FavouriteListModel("id", "imageurl", "com_name", "title", "color", "size", "price", "total_rating", "cart")
    FavouriteListModel('0', "assets/images/img_image_25.png", "LIME", "Shirt",
        "Blue", "L", "32", 10, false,2.3),
    FavouriteListModel('0', "assets/images/img_image_6.png", "Mango",
        "Longsleeve Violeta", "Orange", "S", "46", 5, false,4.1),
    FavouriteListModel('0', "assets/images/img_image_27.png", "Olivier",
        "Shirt", "Gray", "L", "52", 3, true,3.2),
    FavouriteListModel('0', "assets/images/w_top3.png", "&Berries", "T-Shirt",
        "Black", "S", "25", 10, true,2),
  ];
  List<HomeNewListModel> images2 = [
    // HomeNewListModel("id", "imageurl", "discount", 2, "total_rating",
    // "like", "com_name", "title", old_price, new_price)
    HomeNewListModel('0', "assets/images/img_image_184x162.png", "", 2, "10",
        "", "LIME", "Shirt", "15", "10"),
    HomeNewListModel('0', "assets/images/img_image_184x162.png", "", 3, "8", "",
        "Mango", "Longsleeve Violeta", "25", "20"),
    HomeNewListModel('0', "assets/images/img_image_184x162.png", "", 3.5, "11",
        "", "Olivier", "Shirt", "20", "15"),
    HomeNewListModel('0', "assets/images/img_image_184x162.png", "", 4.2, "17",
        "", "&Berries", "T-Shirt", "27", "19"),
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
                                .showError(context, "Comming soon..");
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
                  "Favorites",
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
                        child: GestureDetector(
                          onTap: () {
                            globalNavigationKey.currentState?.push(
                                SlideRightRoute(
                                    page: FilterScreen(),
                                    settings: RouteSettings(
                                        name: FilterScreen.filterScreen)));
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
                            child: InkWell(
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
                  padding: const EdgeInsets.only(left: 16,right: 16),
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
                          child: FavouriteListWidget(
                              favouriteListModel: images1[index]));
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
                  padding: const EdgeInsets.only(left: 9,right: 9),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 16),
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
                              homeNewListModel: images2[index]));
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
