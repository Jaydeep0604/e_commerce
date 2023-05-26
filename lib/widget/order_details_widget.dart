import 'package:e_commerce/model/order_details_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_decoration.dart';
import 'package:e_commerce/utils/app_style.dart';
import 'package:e_commerce/utils/color_constant.dart';
import 'package:e_commerce/widget/custom_image_view.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatefulWidget {
  OrderDetailsWidget({Key? key, required this.orderDetailsModel})
      : super(key: key);
  OrderDetailsModel orderDetailsModel;

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      decoration: BoxDecoration(
          color: AppColors.darkColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 104,
            width: 104,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: "${widget.orderDetailsModel.imageurl}",
                  height: 104,
                  width: 104,
                  radius: BorderRadius.only(
                    topLeft: Radius.circular(
                      8,
                    ),
                    bottomLeft: Radius.circular(8),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 11,
                top: 10,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${widget.orderDetailsModel.title}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16,color: AppColors.white)
                  ),
                  Text(
                    "${widget.orderDetailsModel.com_name}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: AppColors.greyColor,fontSize: 11),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1,
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
                                text: "${widget.orderDetailsModel.color}",
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
                                  text: " ",
                                  style: TextStyle(
                                    color: ColorConstant.gray500,
                                    fontSize: 11,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "L",
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
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            "Units: ",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                           Text(
                            "${widget.orderDetailsModel.total_unit}",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "${widget.orderDetailsModel.price}\$",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ))
                    ],
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
