// ignore_for_file: deprecated_member_use

import 'package:e_commerce/ui/filter/filter_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  List<String> brandList = [
    "adidas",
    "adidas Originals",
    "Blend",
    "Boutique Moschino",
    "Champion",
    "Diesel",
    "Jack & Jones",
    "Naf Naf",
    "Red Valentino",
    "s.Oliver"
  ];
  TextEditingController editingController = TextEditingController();
  List<String> duplicateItems = [
    "adidas",
    "adidas Originals",
    "Blend",
    "Boutique Moschino",
    "Champion",
    "Diesel",
    "Jack & Jones",
    "Naf Naf",
    "Red Valentino",
    "s.Oliver"
  ];
  // late List<bool> valuefirst;
  late List<bool> valuesecond;

  @override
  void initState() {
    // brandList.addAll(duplicateItems);
    valuesecond = List<bool>.filled(brandList.length, false);

    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = brandList;
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = brandList;
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        brandList.clear();
        brandList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        brandList.clear();
        brandList.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          context: context,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppContent(
                  isNeedCenterTitle: "Brand",
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    style: TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                        fillColor: AppColors.darkColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(8),
                          child: Image.asset('assets/icons/search_icon.png'),
                          width: 18,
                        )),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: brandList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        // Expanded(
                        //   child: Text(
                        //     '${brandList[index]}',
                        //     style: TextStyle(
                        //         color:brandList[index]==valuesecond[index]
                        //             ? AppColors.primaryColor
                        //             : AppColors.white),
                        //   ),
                        // ),
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              "${brandList[index]}",
                              style: TextStyle(
                                  color: valuesecond[index] == true
                                      ? AppColors.primaryColor
                                      : AppColors.white),
                            ),
                            activeColor:  AppColors.primaryColor,
                            contentPadding:EdgeInsets.all(0),
                            autofocus: false,
                            checkColor: AppColors.white,
                            side: BorderSide(color: AppColors.white),
                            selected: valuesecond[index],
                            value: valuesecond[index],
                            onChanged: (value) {
                              setState(() {
                                valuesecond[index] = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
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
                          //               builder: (context) => FilterScreen()));
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
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FilterScreen()));
                        },
                        child: Text("Apply")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
