import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({Key? key, required this.homeNewListModel})
      : super(key: key);

  HomeNewListModel homeNewListModel;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.darkColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Container(
                child: Text(
                  "${widget.homeNewListModel.title}",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  "${widget.homeNewListModel.imageurl}",
                  fit: BoxFit.cover,
                )),
          ))
        ],
      ),
    );
  }
}
