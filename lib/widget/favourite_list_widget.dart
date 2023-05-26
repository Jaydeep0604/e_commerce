import 'package:e_commerce/model/favourite_list_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FavouriteListWidget extends StatefulWidget {
  FavouriteListWidget({Key? key, required this.favouriteListModel})
      : super(key: key);
  FavouriteListModel favouriteListModel;

  @override
  State<FavouriteListWidget> createState() => _FavouriteListWidgetState();
}

class _FavouriteListWidgetState extends State<FavouriteListWidget> {
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      // color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 104,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColors.darkColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                      height: 104,
                      width: 104,
                      decoration: BoxDecoration(
                          // color: AppColors.darkColor,
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      )),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        child: Image.asset(
                          '${widget.favouriteListModel.imageurl}',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, top: 15),
                                child: Text(
                                  "${widget.favouriteListModel.com_name}",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 11),
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, top: 2),
                                child: Text(
                                  "${widget.favouriteListModel.title}",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 11,
                              top: 4,
                            ),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Color:",
                                        style: TextStyle(
                                          color: ColorConstant.blueGray200,
                                          fontSize: 11,
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${widget.favouriteListModel.color}",
                                        style: TextStyle(
                                          color: ColorConstant.gray100,
                                          fontSize: 11,
                                          fontFamily: 'Metropolis',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 13,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Size:",
                                          style: TextStyle(
                                            color: ColorConstant.blueGray200,
                                            fontSize: 11,
                                            fontFamily: 'Metropolis',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${widget.favouriteListModel.size}",
                                          style: TextStyle(
                                            color: ColorConstant.gray100,
                                            fontSize: 11,
                                            fontFamily: 'Metropolis',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 11, top: 8),
                                    child: Text(
                                      "${widget.favouriteListModel.price}\$",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 14),
                                    ),
                                  )),
                              SizedBox(
                                width: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 11, top: 8),
                                  child: Row(
                                    children: [
                                      SmoothStarRating(
                                        borderColor: AppColors.blck,
                                        allowHalfRating: true,
                                        color: AppColors.ratingColor,
                                        spacing: 0,
                                        rating: widget.favouriteListModel.rating,
                                        size: 18,
                                        starCount: 5,
                                        isReadOnly: true,
                                        onRated: (value) {
                                          setState(() {
                                            rating = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        "(${widget.favouriteListModel.total_rating})",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.greyColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            if(widget.favouriteListModel.cart == true)
            Padding(
              padding: const EdgeInsets.only(right: 0, bottom: 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/img_bag.svg",
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
