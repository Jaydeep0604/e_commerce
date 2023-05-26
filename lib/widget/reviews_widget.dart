import 'package:e_commerce/model/reviews_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewsWidget extends StatefulWidget {
  ReviewsWidget({Key? key, required this.reviewsModel}) : super(key: key);
  ReviewsModel reviewsModel;

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 313,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 297,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.darkColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 297,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.reviewsModel.name}",
                            style: TextStyle(
                                color: AppColors.greyColor, fontSize: 14),
                          ),
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    SmoothStarRating(
                                      borderColor: AppColors.blck,
                                      allowHalfRating: true,
                                      color: AppColors.ratingColor,
                                      spacing: 0,
                                      rating: widget.reviewsModel.rating,
                                      size: 18,
                                      starCount: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${widget.reviewsModel.date}",
                                  style: TextStyle(color: AppColors.greyColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          "${widget.reviewsModel.review}",
                          style: TextStyle(
                              color: AppColors.greyColor, fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Helpful",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            SvgPicture.asset(
                                "assets/images/img_volume_blue_gray_200.svg")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              // color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "${widget.reviewsModel.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReviewsWithPhotoWidget extends StatefulWidget {
  ReviewsWithPhotoWidget({Key? key, required this.reviewsModel})
      : super(key: key);
  ReviewsModel reviewsModel;

  @override
  State<ReviewsWithPhotoWidget> createState() => _ReviewsWithPhotoWidgetState();
}

class _ReviewsWithPhotoWidgetState extends State<ReviewsWithPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 413,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 413,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.darkColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 297,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.reviewsModel.name}",
                            style: TextStyle(
                                color: AppColors.greyColor, fontSize: 14),
                          ),
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    SmoothStarRating(
                                      borderColor: AppColors.blck,
                                      allowHalfRating: true,
                                      color: AppColors.ratingColor,
                                      spacing: 0,
                                      rating: widget.reviewsModel.rating,
                                      size: 18,
                                      starCount: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${widget.reviewsModel.date}",
                                  style: TextStyle(color: AppColors.greyColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          "${widget.reviewsModel.review}",
                          style: TextStyle(
                              color: AppColors.greyColor, fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 100,
                          child: ListView(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/images/img_image2_104x104.png"),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/images/img_image2_104x104.png"),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/images/img_image2_104x104.png"),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Helpful",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            SvgPicture.asset(
                                "assets/images/img_volume_blue_gray_200.svg")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              // color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "${widget.reviewsModel.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
