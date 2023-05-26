import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/model/promo_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/address/shipping_address.dart';
import 'package:e_commerce/ui/bag/bag_checkout_screen.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/utils/route_transition.dart';
import 'package:e_commerce/widget/ECEditText.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/mybag_item_widget.dart';
import 'package:e_commerce/widget/promo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class BagScreen extends StatefulWidget {
  static const bagScreen = "/bagscreen";
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  TextEditingController promoCtr = TextEditingController();
  PromoModel? _promoModel;
  List<HomeNewListModel> images1 = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/img_image_104x104.png", "", 2, "10",
        "", "Sitlly", "Evening Dress", "19", "15"),
    HomeNewListModel('1', "assets/images/img_image.png", "Two Medium Pizza", 3,
        "12", "", "Dorothy Perkins", "Sport Dress", "15", "12"),
    HomeNewListModel('2', "assets/images/img_image4.png", "", 4, "8", "",
        "Sitlly", "Evening Dress", "20", "18"),
    // HomeNewListModel('3', "assets/images/img_image_413x275.png", "", "", "5",
    //     "", "Dorothy Perkins", "Sport Dress", "25", "30"),
  ];

  List<PromoModel> promoList = [
    // PromoModel("disscount", "title", "promoCode", "remainingDays",)
    PromoModel(
      "10",
      "Personal offer",
      "Personaloffer2023",
      "6",
    ),
    PromoModel(
      "15",
      "Summer Sale",
      "summer2023",
      "3",
    ),
    PromoModel(
      "22",
      "Personal offer",
      "Personal2023",
      "5",
    ),
    // PromoModel(
    //   "30",
    //   "Special Sale",
    //   "Specialsale2023",
    //   "8",
    // ),
    // PromoModel(
    //   "26",
    //   "Special Sale",
    //   "Specialsale2023",
    //   "9",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusManager.instance.primaryFocus?.unfocus();
      }),
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Bag",
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 34),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 22, right: 14),
                  child: Expanded(
                    child: GestureDetector(
                      onTap: (() {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }),
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: images1.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => "SpecialsCombosScreen"()),
                                // );
                              },
                              child: MybagItemWidget(
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
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, right: 16, left: 16),
                  child: Column(
                    children: [
                      ECEditText(
                          // textEditingController: nameCtr,
                          textInputType: TextInputType.text,
                          hint: "Enter your promo code",
                          // enabled:
                          //     registerModel?.firstName == null,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          suffixIcon: GestureDetector(
                            onTap: (() {
                              showModalBottomSheet(
                                  backgroundColor: AppColors.backgroundColor,
                                  isDismissible: false,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0))),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return ScrollConfiguration(
                                      behavior: NoGlow(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 15, right: 16, left: 16),
                                              child: Column(
                                                children: [
                                                  ECEditText(
                                                      textEditingController:
                                                          promoCtr,
                                                      textInputType:
                                                          TextInputType.text,
                                                      hint:
                                                          "Enter your promo code",
                                                      // enabled:
                                                      //     registerModel?.firstName == null,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            30),
                                                      ],
                                                      // validator: (value) {
                                                      //   if (value?.trimLeft().trimRight().isEmpty ?? true) {
                                                      //     return "Please enter your first name";
                                                      //   }
                                                      //   if (value != null && value.length < 3) {
                                                      //     return "First name must be minimum 3 characters";
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      suffixIcon:
                                                          GestureDetector(
                                                        onTap: (() {
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        }),
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Container(
                                                                height: 36,
                                                                width: 36,
                                                                child: Image.asset(
                                                                    "assets/icons/inactive.png"))),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(14),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Your Promo Codes",
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: ListView.separated(
                                                // physics: AlwaysScrollableScrollPhysics(
                                                // ),
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                primary: false,
                                                itemCount: promoList.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (context) =>
                                                        //           CategoriesScreen()),
                                                        // );
                                                      },
                                                      child: PromoWidget(
                                                          promoModel: promoList[
                                                              index]));
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SizedBox(
                                                    height: 10,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }),
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    height: 36,
                                    width: 36,
                                    child: Image.asset(
                                        "assets/icons/inactive.png"))),
                          ))
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 14, right: 14, top: 28),
                    child: Row(
                      children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Total amount:",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 14),
                                ))),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("45\$",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 22)))),
                      ],
                    )),
              ],
            )),
          ),
        ),
        bottomNavigationBar: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 24,bottom: 10),
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
                          FocusManager.instance.primaryFocus?.unfocus();
                          globalNavigationKey.currentState?.push(
                            SlideRightRoute(
                              page: ShippinAddress(),
                              settings: RouteSettings(
                                name: ShippinAddress.shippinAddress,
                              ),
                            ),
                          );
                          // Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => BagCheckoutScreen()));
                        },
                        child: Text("Next")),
                  ),
                ),
      ),
    );
  }
}
