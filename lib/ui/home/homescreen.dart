import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/fashionsale/home_items_screen.dart';
import 'package:e_commerce/ui/new_collection/new_collection_screen.dart';
import 'package:e_commerce/ui/product_card/product_card_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/route_transition.dart';
import 'package:e_commerce/widget/home_items_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const homeScreen = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeNewListModel> images1 = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/img_image_1.png", "NEW", 3, "10",
        "", "Sitlly", "Evening Dress", "19", "15"),
    HomeNewListModel('1', "assets/images/img_image_2.png", "NEW", 4,
        "12", "", "Dorothy Perkins", "Sport Dress", "15", "12"),
    HomeNewListModel('2', "assets/images/img_image4.png", "NEW", 2.5, "8", "",
        "Sitlly", "Evening Dress", "20", "18"),
    HomeNewListModel('3', "assets/images/img_image_16.png", "NEW", 3, "5", "",
        "Dorothy Perkins", "Sport Dress", "25", "30"),
  ];
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ScrollConfiguration(
          behavior: NoGlow(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 536,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/BigBanner.png",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 334),
                        child: Container(
                            height: 107,
                            width: 190,
                            child: Text(
                              "Fashion\nsale",
                              style: TextStyle(
                                  color: AppColors.whiteColor, fontSize: 48),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 0, left: 10, top: 458),
                        child: Container(
                          width: 160,
                          height: 36,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  primary: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeItemsScreen())).then((value) {
                                    // formKey.currentState?.reset();
                                  }),
                              child: Text("Check")),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Container(
                            child: Text(
                              "New",
                              style: TextStyle(
                                  fontSize: 34, color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NewCollectionScreen()));
                              }),
                              child: Container(
                                child: Text(
                                  "View all",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.whiteColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "You’ve never seen it before!",
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 22),
                  child: Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: images1.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (() {
                            globalNavigationKey.currentState?.push(
                                SlideRightRoute(
                                    page: ProductCardScreen(),
                                    settings: RouteSettings(
                                        name: ProductCardScreen
                                            .productCardScreen)));
                          }),
                          child: HomeItemsListWidget(
                              homeNewListModel: images1[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
