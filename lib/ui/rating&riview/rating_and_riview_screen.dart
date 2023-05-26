import 'dart:io';

import 'package:e_commerce/model/reviews_model.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/rating_bar.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/reviews_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingAndReviewScreen extends StatefulWidget {
  const RatingAndReviewScreen({Key? key}) : super(key: key);

  @override
  State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
}

class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
  bool value = false;
  List<ReviewsModel> reviewList = [
    // ReviewsModel("id", "imageUrl", "name", "date", "rating", "review", "helpfull"),
    ReviewsModel(
        "1",
        "assets/images/img_image_32x32.png",
        "Helene Moore",
        "June 5, 2019",
        3,
        "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
        true),
    ReviewsModel(
        "2",
        "assets/images/img_image_32x32.png",
        "Kate Doe",
        "June 5, 2019",
        4,
        "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
        true),
  ];

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWithBottom(
        context: context,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppContent(
                  isNeedCenterTitle: "",
                  isNeedLeading: false,
                  isNeedProfile: false,
                  leadingIcon: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/icons/back_icon.png",
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rating&Reviews",
                  style: TextStyle(fontSize: 34, color: AppColors.whiteColor),
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
              Container(
                height: 105,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "4.3",
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 44),
                            ),
                            Text(
                              "23 ratings",
                              style: TextStyle(
                                  color: AppColors.greyColor, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(child: RatingChartRow(label: 5, pct: 12)),
                            Expanded(child: RatingChartRow(label: 4, pct: 5)),
                            Expanded(child: RatingChartRow(label: 3, pct: 4)),
                            Expanded(child: RatingChartRow(label: 2, pct: 2)),
                            Expanded(child: RatingChartRow(label: 1, pct: 0)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      "8 reviews",
                      style: TextStyle(color: AppColors.white, fontSize: 24),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: this.value,
                              checkColor: AppColors.white,
                              activeColor: AppColors.primaryColor,
                              side: BorderSide(color: AppColors.white),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value = value!;
                                  value = true;
                                });
                              },
                            ),
                            Text(
                              "With photo",
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (value == true)
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 22),
                  child: ListView.separated(
                    // physics: AlwaysScrollableScrollPhysics(
                    // ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: reviewList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => "SpecialsCombosScreen"()),
                            // );
                          },
                          child: GestureDetector(
                            onTap: (() {
                              // globalNavigationKey.currentState?.push(
                              //     SlideRightRoute(
                              //         page: ProductCardScreen(),
                              //         settings: RouteSettings(
                              //             name: ProductCardScreen
                              //                 .productCardScreen)));
                            }),
                            child: ReviewsWithPhotoWidget(
                                reviewsModel: reviewList[index]),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
              if (value == false)
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 22),
                  child: ListView.separated(
                    // physics: AlwaysScrollableScrollPhysics(
                    // ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: reviewList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => "SpecialsCombosScreen"()),
                            // );
                          },
                          child: GestureDetector(
                            onTap: (() {
                              // globalNavigationKey.currentState?.push(
                              //     SlideRightRoute(
                              //         page: ProductCardScreen(),
                              //         settings: RouteSettings(
                              //             name: ProductCardScreen
                              //                 .productCardScreen)));
                            }),
                            child:
                                ReviewsWidget(reviewsModel: reviewList[index]),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(right: 11, left: 230, top: 5, bottom: 10),
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
                showModalBottomSheet(
                    backgroundColor: AppColors.backgroundColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0))),
                    isDismissible: false,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      final MediaQueryData mediaQueryData =
                          MediaQuery.of(context);

                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        var rating = 0.0;
                        void selectImages() async {
                          final List<XFile>? selectedImages =
                              await imagePicker.pickMultiImage();
                          if (selectedImages!.isNotEmpty) {
                            imageFileList!.addAll(selectedImages);
                          }
                          print("Image List Length:" +
                              imageFileList!.length.toString());
                          setState(() {});
                        }

                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Padding(
                            padding: mediaQueryData.viewInsets,
                            child: ScrollConfiguration(
                              behavior: NoGlow(),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 20,
                                        // bottom: 10
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "What is you rate?",
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 17),
                                      child: SmoothStarRating(
                                        borderColor: AppColors.blck,
                                        allowHalfRating: true,
                                        color: AppColors.ratingColor,
                                        spacing: 0,
                                        rating: rating,
                                        size: 37,
                                        starCount: 5,
                                        onRated: (value) {
                                          setState(() {
                                            rating = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        // left: 16,
                                        // right: 16,
                                        top: 20,
                                        // bottom: 10
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Please share your opinion \nabout the product",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, top: 18),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.darkColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextFormField(
                                          cursorColor: AppColors.primaryColor,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 6,
                                          style:
                                              TextStyle(color: AppColors.white),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: AppColors.white,
                                              hintText: "Your review",
                                              hintStyle: TextStyle(
                                                  color: AppColors.greyColor),
                                              prefixIcon: Container(
                                                width: 0,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 104,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                primary: false,
                                                shrinkWrap: true,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectImages();
                                                    },
                                                    child: Container(
                                                      height: 104,
                                                      width: 104,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .darkColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 17,
                                                            ),
                                                            Container(
                                                              height: 52,
                                                              width: 52,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(15),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        "assets/images/img_camera.svg"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Add your photos",
                                                              style: TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontSize: 11),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        imageFileList!.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Container(
                                                        height: 104,
                                                        width: 104,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.file(
                                                            File(imageFileList![
                                                                    index]
                                                                .path),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return SizedBox(
                                                        width: 10,
                                                      );
                                                    },
                                                  ),
                                                  
                                                  
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16, left: 16, bottom: 20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                primary: AppColors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50))),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("SEND REVIEW")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    });
              },
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/img_edit.svg"),
                    Text(
                      "Write a review",
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
