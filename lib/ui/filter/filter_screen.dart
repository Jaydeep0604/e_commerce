import 'dart:math';

import 'package:e_commerce/ui/brand/brand_screen.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const filterScreen = "/filterScreen";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(73, 143);
  bool black = false;
  bool white = false;
  bool orange = false;
  bool lightPink = false;
  bool lightGreen = false;
  bool pantom = false;

  bool xs = false;
  bool s = false;
  bool m = false;
  bool l = false;
  bool xl = false;
  Color _colorContainer = AppColors.primaryColor;

  List<String> gridList = ["All", "Women", "Men", "Boys", "Girls"];
  int gridChacked = -1;
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
                isNeedCenterTitle: "Filters",
                isNeedLeading: false,
                isNeedProfile: false,
                leadingIcon: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () async {
                        // bool isPop =
                        //     await navigatorKeys[Base.getCurrentTab(context)]!
                        //         .currentState!
                        //         .maybePop();
                        // if (!isPop) {
                        //   Base.switchTab(context, MyTabItem.home);
                        // }
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/icons/back_icon.png",
                        width: 20,
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
            children: [
              Card(
                color: AppColors.backgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Price range",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 23),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "${_currentRangeValues.start.toInt().toString()}\$",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 14),
                          )),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${_currentRangeValues.end.toInt().toString()}\$",
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 14),
                                  )))
                        ],
                      ),
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      max: 143,
                      min: 73,
                      divisions: max(73, 143),
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.white,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.backgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 36),
                      child: Container(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  black = true;
                                  white = false;
                                  orange = false;
                                  lightPink = false;
                                  lightGreen = false;
                                  pantom = false;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: black
                                            ? AppColors.white
                                            : AppColors.backgroundColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.blck,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  black = false;
                                  white = true;
                                  orange = false;
                                  lightPink = false;
                                  lightGreen = false;
                                  pantom = false;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: white
                                            ? AppColors.white
                                            : AppColors.backgroundColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  black = false;
                                  white = false;
                                  orange = true;
                                  lightPink = false;
                                  lightGreen = false;
                                  pantom = false;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: orange
                                            ? AppColors.white
                                            : AppColors.backgroundColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.orangeColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  black = false;
                                  white = false;
                                  orange = false;
                                  lightPink = true;
                                  lightGreen = false;
                                  pantom = false;
                                });
                              },
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: lightPink
                                            ? AppColors.white
                                            : AppColors.backgroundColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.lightPinkColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  black = false;
                                  white = false;
                                  orange = false;
                                  lightPink = false;
                                  lightGreen = true;
                                  pantom = false;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: lightGreen
                                            ? AppColors.white
                                            : AppColors.backgroundColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.lightGreenColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  black = false;
                                  white = false;
                                  orange = false;
                                  lightPink = false;
                                  lightGreen = false;
                                  pantom = true;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: pantom
                                            ? AppColors.white
                                            : AppColors.backgroundColor),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.panToneColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Card(
                color: AppColors.backgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sizes",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 36),
                      child: Container(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  xs = false;
                                  _colorContainer = _colorContainer ==
                                          AppColors.backgroundColor
                                      ? AppColors.backgroundColor
                                      : AppColors.primaryColor;
                                });
                              },
                              onTap: (() {
                                setState(() {
                                  xs = true;
                                  _colorContainer =
                                      _colorContainer == AppColors.primaryColor
                                          ? AppColors.primaryColor
                                          : AppColors.backgroundColor;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: xs
                                        ? AppColors.primaryColor
                                        : AppColors.backgroundColor,
                                    border: Border.all(
                                      color: xs
                                          ? AppColors.primaryColor
                                          : AppColors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text("XS",
                                        style:
                                            TextStyle(color: AppColors.white))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  s = false;
                                  _colorContainer = _colorContainer ==
                                          AppColors.backgroundColor
                                      ? AppColors.backgroundColor
                                      : AppColors.primaryColor;
                                });
                              },
                              onTap: (() {
                                setState(() {
                                  s = true;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: s
                                        ? AppColors.primaryColor
                                        : AppColors.backgroundColor,
                                    border: Border.all(
                                      color: s
                                          ? AppColors.primaryColor
                                          : AppColors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text("S",
                                        style:
                                            TextStyle(color: AppColors.white))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  m = false;
                                  _colorContainer = _colorContainer ==
                                          AppColors.backgroundColor
                                      ? AppColors.backgroundColor
                                      : AppColors.primaryColor;
                                });
                              },
                              onTap: (() {
                                setState(() {
                                  m = true;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: m
                                        ? AppColors.primaryColor
                                        : AppColors.backgroundColor,
                                    border: Border.all(
                                      color: m
                                          ? AppColors.primaryColor
                                          : AppColors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text("M",
                                        style:
                                            TextStyle(color: AppColors.white))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  l = false;
                                  _colorContainer = _colorContainer ==
                                          AppColors.backgroundColor
                                      ? AppColors.backgroundColor
                                      : AppColors.primaryColor;
                                });
                              },
                              onTap: (() {
                                setState(() {
                                  l = true;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: l
                                        ? AppColors.primaryColor
                                        : AppColors.backgroundColor,
                                    border: Border.all(
                                      color: l
                                          ? AppColors.primaryColor
                                          : AppColors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text("L",
                                        style:
                                            TextStyle(color: AppColors.white))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  xl = false;
                                  _colorContainer = _colorContainer ==
                                          AppColors.backgroundColor
                                      ? AppColors.backgroundColor
                                      : AppColors.primaryColor;
                                });
                              },
                              onTap: (() {
                                setState(() {
                                  xl = true;
                                });
                              }),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: xl
                                          ? AppColors.primaryColor
                                          : AppColors.white,
                                    ),
                                    color: xl
                                        ? AppColors.primaryColor
                                        : AppColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  "XL",
                                  style: TextStyle(color: AppColors.white),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Card(
                color: AppColors.backgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 24),
                      child: GridView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 22,
                                  mainAxisSpacing: 12),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (() {
                                setState(() {
                                  gridChacked = index;
                                });
                              }),
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: gridChacked == index
                                        ? AppColors.primaryColor
                                        : AppColors.backgroundColor,
                                    border: Border.all(
                                        color: gridChacked == index
                                            ? AppColors.primaryColor
                                            : AppColors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  "${gridList[index]}",
                                  style: TextStyle(color: AppColors.white),
                                )),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Card(
                color: AppColors.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 18, right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Brand",
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  "adidas Originals, Jack & Jones, s.Oliver",
                                  style: TextStyle(color: AppColors.greyColor),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BrandScreen()));
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                "assets/icons/right.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 11, left: 11, bottom: 10, top: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          primary: AppColors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.white),
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context);
                        // Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => BagCheckoutScreen()));
                      },
                      child: Text("Discard")),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 11, left: 11, top: 0),
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
                        Navigator.pop(context);
                        // Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => BagCheckoutScreen()));
                      },
                      child: Text("Apply")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
