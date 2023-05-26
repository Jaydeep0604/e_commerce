import 'package:e_commerce/model/promo_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/address/shipping_address.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/myorder/my_order_screen.dart';
import 'package:e_commerce/ui/payment/payment_card_screen.dart';
import 'package:e_commerce/ui/rating&riview/rating_and_riview_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/utils/route_transition.dart';
import 'package:e_commerce/widget/ECEditText.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/promo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  static const profileScreen = "/profilescreen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController promoCtr = TextEditingController();
  PromoModel? _promoModel;
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
                                .showError(context, "Comming soon...");
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
          Container(
            padding: EdgeInsets.only(left: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My profile",
                style: TextStyle(fontSize: 34, color: AppColors.whiteColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 24),
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                            Image.asset("assets/images/img_image_64x64.png")),
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Matilda Brown",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 14),
                        ),
                        Text("matildabrown@mail.com",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
            child: Column(
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyOrderScreen()));
                  }),
                  child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "My orders",
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Already have 12 orders",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippinAddress()));
                  }),
                  child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Shipping addresses",
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "3 ddresses",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentCardScreen()));
                  }),
                  child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment methods",
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Visa  **34",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ),
                InkWell(
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
                                            textEditingController: promoCtr,
                                            textInputType: TextInputType.text,
                                            hint: "Enter your promo code",
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
                                            suffixIcon: GestureDetector(
                                              onTap: (() {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
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
                                                promoModel: promoList[index]));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
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
                  child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Promocodes",
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "You have special promocodes",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RatingAndReviewScreen()));
                  }),
                  child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "My reviews",
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Reviews for 4 items",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ),
                InkWell(
                  onTap: (() {
                    globalNavigationKey.currentState?.push(
                      SlideRightRoute(
                        page: SettingsScreen(),
                        settings: RouteSettings(
                          name: SettingsScreen.settingScreen,
                        ),
                      ),
                    );
                  }),
                  child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Notifications, password",
                                  style: TextStyle(
                                      color: AppColors.greyColor, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
