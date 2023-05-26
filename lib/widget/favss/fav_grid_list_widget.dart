import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../model/home_new_List_model.dart';
import '../../utils/app_colors.dart';

class FavGridListWidget extends StatefulWidget {
  HomeNewListModel homeNewListModel;

  FavGridListWidget({Key? key, required this.homeNewListModel})
      : super(key: key);

  @override
  State<FavGridListWidget> createState() => _FavGridListWidgetState();
}

class _FavGridListWidgetState extends State<FavGridListWidget> {
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
      height: 250,
      child: Stack(
        
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.only(left: 1, top: 1),
              child: Container(
                child: Image.asset(
                  
                  "${widget.homeNewListModel.imageurl}",
                  fit: BoxFit.cover,
                  height: 140,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 112),
            child: Container(
              height: 40,
              width: 40,
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
          Padding(
            padding:  EdgeInsets.only(top: 155),
            child: Expanded(
              child: Column(
                children: [
                  Row(
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
                        style: TextStyle(fontSize: 10, color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  Container(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${widget.homeNewListModel.com_name}",
                          style:
                              TextStyle(fontSize: 11, color: Colors.red),
                        )),
                  ),
                Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.homeNewListModel.title}",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.whiteColor),
                      )),
                ),
                
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
