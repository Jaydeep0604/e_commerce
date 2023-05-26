import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/address/shipping_address.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/payment/payment_card_screen.dart';
import 'package:e_commerce/ui/success/success_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BagCheckoutScreen extends StatefulWidget {
  static const bagCheckoutScreen = "/bagCheckoutScreen";
  const BagCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<BagCheckoutScreen> createState() => _BagCheckoutScreenState();
}

class _BagCheckoutScreenState extends State<BagCheckoutScreen> {
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
                isNeedCenterTitle: "Checkout",
                isNeedLeading: false,
                isNeedProfile: false,
                leadingIcon: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        // bool isPop =
                        //     await navigatorKeys[Base.getCurrentTab(context)]!
                        //         .currentState!
                        //         .maybePop();
                        // if (!isPop) {
                        //   Base.switchTab(context, MyTabItem.home);
                        // }
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/img_arrowleft.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Shipping address",
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16, top: 21, right: 16),
                  child: Container(
                    height: 108,
                    decoration: BoxDecoration(
                        color: AppColors.darkColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18, left: 28),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Jane Doe",
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 23),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShippinAddress()));
                                        },
                                        child: Text(
                                          "Change",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.errorColor),
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
                            padding: const EdgeInsets.only(left: 28, top: 7),
                            child: Text(
                              "3 Newbridge Court\nChino Hills, CA 91709, United States",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  height: 108,
                  decoration: BoxDecoration(
                      color: AppColors.darkColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 13, left: 16, right: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Payment",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.white),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentCardScreen()));
                                      },
                                      child: Text(
                                        "Change",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.errorColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 17),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 38,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                    "assets/images/img_lightbulb.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 17),
                              child: Text(
                                "**** **** **** 3947",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 35),
                child: Text(
                  "Delivery method",
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 21),
                child: Row(children: [
                  Expanded(
                    child: Container(
                      height: 72,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: Container(
                              height: 17,
                              // width: 61,
                              color: AppColors.white,
                              child: SvgPicture.asset(
                                  "assets/images/img_layer1.svg"),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: Text(
                                " 2-3 days",
                                style: TextStyle(
                                    color: AppColors.greyColor, fontSize: 11),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 72,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: Container(
                              height: 17,
                              // width: 61,
                              color: AppColors.white,
                              child:
                                  SvgPicture.asset("assets/images/img_car.svg"),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: Text(
                                " 2-3 days",
                                style: TextStyle(
                                    color: AppColors.greyColor, fontSize: 11),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 72,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: Container(
                              height: 17,
                              // width: 61,
                              color: AppColors.white,
                              child: SvgPicture.asset(
                                  "assets/images/img_television.svg"),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: Text(
                                " 2-3 days",
                                style: TextStyle(
                                    color: AppColors.greyColor, fontSize: 11),
                              ))
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 52),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Order:",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  "112\$",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Delivery:",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  "15\$",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Summary:",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Text(
                                  "127\$",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
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

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessScreen()));
                      },
                      child: Text("SUBMIT ORDER")),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
