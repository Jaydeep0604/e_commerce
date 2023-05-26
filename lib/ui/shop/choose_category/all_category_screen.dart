import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';

class AllCategoryScreen extends StatefulWidget {
  static const allCategoryScreen = "/allCategoryScreen";
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  final item = [
    "Tops",
    "Shirts & Blouses",
    "Knitwear",
    "Blazers",
    "Outerwear",
    "Pants",
    "Jeans",
    "Shorts",
    "Skirts",
    "Dresses"
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
                            ECToast.instance.showError(context, "Comming soon...");
                            // bool isPop = await navigatorKeys[
                            //         Base.getCurrentTab(context)]!
                            //     .currentState!
                            //     .maybePop();
                            // if (!isPop) {
                            //   Base.switchTab(context, MyTabItem.home);
                            // }
                          },
                          child: Image.asset(
                            "assets/icons/search_icon.png",
                            width: 20,
                          ),
                        )))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        primary: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      // Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => RegisterScreen()))
                      //     .then((value) {
                      //   // formKey.currentState?.reset();
                      // });
                    },
                    child: Text("VIEW ALL ITEMS")),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose category",
                    style: TextStyle(color: AppColors.greyColor, fontSize: 14),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: ListView.separated(
                // physics: AlwaysScrollableScrollPhysics(
                // ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text(
                        "${item[index]},",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white10,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
