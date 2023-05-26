import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/shop/choose_category/categories_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/categories_widget.dart';
import 'package:flutter/material.dart';

class KidScreen extends StatefulWidget {
  static const kidScreen="/kidScreen";
  const KidScreen({ Key? key }) : super(key: key);

  @override
  State<KidScreen> createState() => _KidScreenState();
}

class _KidScreenState extends State<KidScreen> {
List<HomeNewListModel> images1 = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/kid1.jpeg", "", 2, "", "", "Sitlly",
        "New", "", ""),
    HomeNewListModel('1', "assets/images/kid2.jpeg", "Two Medium Pizza", 0, "",
        "", "", "Clothes", "", ""),
    HomeNewListModel(
        '2', "assets/images/kid3.jpeg", "", 3, "", "", "", "Shoes", "", "",),
    HomeNewListModel('3', "assets/images/kid4.png", "", 2, "", "", "",
        "Accesories", "", ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ChooseCategoryScreen()));
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.sale_hotColor),
                    child: Center(
                        child: Container(
                      height: 45,
                      child: Column(
                        children: [
                          Text(
                            "SUMMER SALES",
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 24),
                          ),
                          Text(
                            "Up to 50% off",
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 14),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.separated(
                  // physics: AlwaysScrollableScrollPhysics(
                  // ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: images1.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesScreen()),
                          );
                        },
                        child:
                            CategoriesWidget(homeNewListModel: images1[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
              // SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}