import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CategoriesListWidget extends StatefulWidget {
  CategoriesListWidget({Key? key, required this.homeNewListModel})
      : super(key: key);
  HomeNewListModel homeNewListModel;

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  // var rating = 2.0;
  bool like = false;
  void liked() {
    setState(() {
      like = !like;
    });
  }

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
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          // color: AppColors.darkColor,
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      )),
                      child: Image.asset(
                        '${widget.homeNewListModel.imageurl}',
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, top: 11),
                                child: Text(
                                  "${widget.homeNewListModel.title}",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16),
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, top: 4),
                                child: Text(
                                  "${widget.homeNewListModel.com_name}",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 11),
                                ),
                              )),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 11, top: 8),
                              child: Row(
                                children: [
                                  SmoothStarRating(
                                    borderColor: AppColors.blck,
                                    allowHalfRating: true,
                                    color: AppColors.ratingColor,
                                    spacing: 0,
                                    rating: widget.homeNewListModel.rating,
                                    size: 18,
                                    isReadOnly: true,
                                    starCount: 5,
                                    // onRated: (value) {
                                    //   setState(() {
                                    //     rating = value;
                                    //   });
                                    // },
                                  ),
                                  Text(
                                    "(${widget.homeNewListModel.total_rating})",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColors.greyColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, top: 8),
                                child: Text(
                                  "${widget.homeNewListModel.new_price}\$",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 14),
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0, bottom: 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.darkColor,
                  ),
                  child: GestureDetector(
                    onTap: liked,
                    child: Transform.scale(
                        scale: 0.9,
                        child: like
                            ? SvgPicture.asset(
                                "assets/images/img_favorite_red_400.svg",
                              )
                            : SvgPicture.asset(
                                "assets/images/img_favorite.svg",
                              )),
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
