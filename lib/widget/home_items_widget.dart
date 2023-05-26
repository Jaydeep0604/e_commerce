import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeItemsListWidget extends StatefulWidget {
  HomeItemsListWidget({Key? key, required this.homeNewListModel})
      : super(key: key);
  HomeNewListModel homeNewListModel;

  @override
  State<HomeItemsListWidget> createState() => _HomeItemsListWidgetState();
}

class _HomeItemsListWidgetState extends State<HomeItemsListWidget> {
  bool like = false;
  var rating = 0.0;
  void intState() {
    super.initState();
    liked();
  }

  void liked() {
    setState(() {
      like = !like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 150,
      // color: AppColors.darkColor,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 1, top: 1),
                  child: Container(
                    height: 184,
                    width: 148,
                    // color: AppColors.white,
                    child: Image.asset(
                      "${widget.homeNewListModel.imageurl}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
                        rating: widget.homeNewListModel.rating,
                        size: 18,
                        isReadOnly: true,
                        starCount: 5,
                        onRated: (value) {
                          setState(() {
                            rating = value;
                          });
                        },
                      ),
                      Text(
                        "(${widget.homeNewListModel.total_rating})",
                        style:
                            TextStyle(fontSize: 10, color: AppColors.greyColor),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.homeNewListModel.com_name}",
                        style:
                            TextStyle(fontSize: 11, color: AppColors.greyColor),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.homeNewListModel.title}",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.whiteColor),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  children: [
                    Text("${widget.homeNewListModel.old_price}\$",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            color: AppColors.whiteColor)),
                    SizedBox(
                      width: 2,
                    ),
                    Text("${widget.homeNewListModel.new_price}\$",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.primaryColor))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 164, left: 112),
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
          if (widget.homeNewListModel.discount.contains("NEW"))
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Container(
                height: 24,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.blck,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "NEW",
                    style: TextStyle(color: AppColors.white, fontSize: 11),
                  ),
                ),
              ),
            ),
          if (widget.homeNewListModel.discount.contains("NEW") == false &&
              widget.homeNewListModel.discount != "")
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Container(
                height: 24,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "-${widget.homeNewListModel.discount}%",
                    style: TextStyle(color: AppColors.white, fontSize: 11),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class HomeItemsGridListWidget extends StatefulWidget {
  HomeItemsGridListWidget({Key? key, required this.homeNewListModel})
      : super(key: key);
  HomeNewListModel homeNewListModel;

  @override
  State<HomeItemsGridListWidget> createState() =>
      _HomeItemsGridListWidgetState();
}

class _HomeItemsGridListWidgetState extends State<HomeItemsGridListWidget> {
  bool like = false;
  var rating = 0.0;
  void intState() {
    super.initState();
    liked();
  }

  void liked() {
    setState(() {
      like = !like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      // width: 150,
      // color: AppColors.darkColor,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 1, top: 1),
                  child: Container(
                    height: 184,
                    // width: 148,
                    // color: AppColors.white,
                    child: Image.asset(
                      "${widget.homeNewListModel.imageurl}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
                        rating: widget.homeNewListModel.rating,
                        size: 18,
                        isReadOnly: true,
                        starCount: 5,
                        onRated: (value) {
                          setState(() {
                            rating = value;
                          });
                        },
                      ),
                      Text(
                        "(${widget.homeNewListModel.total_rating})",
                        style:
                            TextStyle(fontSize: 10, color: AppColors.greyColor),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.homeNewListModel.com_name}",
                        style:
                            TextStyle(fontSize: 11, color: AppColors.greyColor),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.homeNewListModel.title}",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.whiteColor),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  children: [
                    Text("${widget.homeNewListModel.old_price}\$",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            color: AppColors.whiteColor)),
                    SizedBox(
                      width: 2,
                    ),
                    Text("${widget.homeNewListModel.new_price}\$",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.primaryColor))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 167, right: 10),
            child: Align(
              alignment: Alignment.topRight,
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
          if (widget.homeNewListModel.discount.contains("NEW"))
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Container(
                height: 24,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.blck,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "NEW",
                    style: TextStyle(color: AppColors.white, fontSize: 11),
                  ),
                ),
              ),
            ),
          if (widget.homeNewListModel.discount.contains("NEW") == false &&
              widget.homeNewListModel.discount != "")
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Container(
                height: 24,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "-${widget.homeNewListModel.discount}%",
                    style: TextStyle(color: AppColors.white, fontSize: 11),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
