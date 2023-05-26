import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/product_card/product_card_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/home_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeItemsScreen extends StatefulWidget {
  static const homeItemsScreen = "/homeItemsScreen";
  const HomeItemsScreen({Key? key}) : super(key: key);

  @override
  State<HomeItemsScreen> createState() => _HomeItemsScreenState();
}

class _HomeItemsScreenState extends State<HomeItemsScreen> {
  List<HomeNewListModel> saleItem = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/img_image2_184x148.png", "20", 3, "10",
        "", "Sitlly", "Evening Dress", "19", "15"),
    HomeNewListModel('1', "assets/images/img_image_22.png", "15", 4, "13", "",
        "Dorothy Perkins", "Sport Dress", "15", "12"),
    HomeNewListModel('2', "assets/images/img_image_80x80.png", "20", 3, "21",
        "", "Sitlly", "Evening Dress", "20", "18"),
    HomeNewListModel('3', "assets/images/img_image_26.png", "10", 2, "9", "",
        "Dorothy Perkins", "Sport Dress", "25", "30"),
  ];
  List<HomeNewListModel> newItem = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/img_image_1.png", "NEW", 3, "10", "",
        "Sitlly", "Evening Dress", "19", "15"),
    HomeNewListModel('1', "assets/images/img_image_2.png", "NEW", 4, "13", "",
        "Dorothy Perkins", "Sport Dress", "NEW", "12"),
    HomeNewListModel('2', "assets/images/img_image4.png", "NEW", 3, "21", "",
        "Sitlly", "Evening Dress", "20", "18"),
    HomeNewListModel('3', "assets/images/img_image_16.png", "NEW", 2, "9", "",
        "Dorothy Perkins", "Sport Dress", "25", "30"),
  ];
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  "assets/images/img_arrowleft.svg",
                  width: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 196,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/Small_banner.png",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 136),
                    child: Container(
                        height: 107,
                        width: 238,
                        child: Text(
                          "Street clothes",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 34),
                        )),
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
                          "Sale",
                          style: TextStyle(
                              fontSize: 34, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (() {
                            ECToast.instance
                                .showError(context, "Not developed");
                          }),
                          child: Container(
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.whiteColor),
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
                      "Super summer sale",
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
                  // physics: AlwaysScrollableScrollPhysics(
                  // ),
                  scrollDirection: Axis.horizontal,
                  itemCount: saleItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductCardScreen()),
                          );
                        },
                        child: HomeItemsListWidget(
                            homeNewListModel: saleItem[index]));
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
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (() {
                            ECToast.instance
                                .showError(context, "Not developed");
                          }),
                          child: Container(
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.whiteColor),
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
                  // physics: AlwaysScrollableScrollPhysics(
                  // ),
                  scrollDirection: Axis.horizontal,
                  itemCount: newItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductCardScreen()),
                          );
                        },
                        child: HomeItemsListWidget(
                            homeNewListModel: newItem[index]));
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
        )),
      ),
    );
  }
}
