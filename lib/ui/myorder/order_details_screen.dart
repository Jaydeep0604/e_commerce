import 'package:e_commerce/model/order_details_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/order_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const orderDetailsScreen="/orderDetailsScreen";
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<OrderDetailsModel> items = [
    // OrderDetailsModel("id", "imageurl", "com_name", "title", "size", "total_unit", "color", "price")
    OrderDetailsModel(
      '0',
      "assets/images/img_image_104x104.png",
      "Mango",
      'Pullover',
      "L",
      "3",
      "Gray",
      "51",
    ),
    OrderDetailsModel(
      '0',
      "assets/images/w_top3.png",
      "Mango",
      'Pullover',
      "L",
      "3",
      "Gray",
      "51",
    ),
    OrderDetailsModel(
      '0',
      "assets/images/img_image_19.png",
      "Mango",
      'Pullover',
      "L",
      "3",
      "Gray",
      "51",
    ),
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
                    isNeedCenterTitle: "Order Details",
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
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Order №1947034",
                          style: TextStyle(color: AppColors.white),
                        )),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "05-12-2019",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Tracking number:",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          "IW3475453455",
                          style: TextStyle(color: AppColors.white),
                        )),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Delivered",
                            style: TextStyle(color: AppColors.successColor),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "3:",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        Text(
                          "items",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 22, right: 14),
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => "SpecialsCombosScreen"()),
                          // );
                        },
                        child:
                            OrderDetailsWidget(orderDetailsModel: items[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Order information",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 12, top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Shipping Address:",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "3 Newbridge Court ,Chino Hills, CA 91709, United States",
                            style: TextStyle(color: AppColors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Payment method:",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/img_user_yellow_800_25x32.svg",
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "**** **** **** 3947",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Delivery method:",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "FedEx, 3 days, 15\$",
                            style: TextStyle(color: AppColors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Discount:",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "10%, Personal promo code",
                            style: TextStyle(color: AppColors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Total Amount:",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "133\$",
                            style: TextStyle(color: AppColors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 34,bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Reorder",
                                  style: TextStyle(color: AppColors.white),
                                )))),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                        child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Leave feedback",
                                  style: TextStyle(color: AppColors.white),
                                )))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
