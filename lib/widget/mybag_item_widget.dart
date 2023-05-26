import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/app_decoration.dart';
import 'package:e_commerce/utils/app_style.dart';
import 'package:e_commerce/utils/color_constant.dart';
import 'package:e_commerce/utils/image_constant.dart';
import 'package:e_commerce/widget/custom_icon_button.dart';
import 'package:e_commerce/widget/custom_image_view.dart';
import 'package:flutter/material.dart';

class MybagItemWidget extends StatefulWidget {
  MybagItemWidget({Key? key, required this.homeNewListModel}) : super(key: key);
  HomeNewListModel homeNewListModel;

  @override
  State<MybagItemWidget> createState() => _MybagItemWidgetState();
}

class _MybagItemWidgetState extends State<MybagItemWidget> {
  int _itemCount = 1;
  int _price = 51;
  int _price2 = 30;
  int _price3 = 54;
  int k = 51;
  // var p = homeNewListModel.new_price.toString() as int;

  void initState() {
    super.initState();

    cartTotalPrice() {
      _price = (k * _itemCount);
      return _price;
    }
  }

  void cal1() {
    _price = _price + 51;
  }

  void cal2() {
    _price2 = _price2 + 30;
  }

  void cal3() {
    _price3 = _price3 + 54;
  }

  void cal4() {
    _price = _price - 51;
  }

  void cal5() {
    _price2 = _price2 - 30;
  }

  void cal6() {
    _price3 = _price3 - 54;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      // width: 346,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: AppDecoration.outlineBlack90014.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: Row(
                children: [
                  Container(
                    height: 104,
                    width: 104,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: "${widget.homeNewListModel.imageurl}",
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
                  Padding(
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
                          "Pullover",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMetropolisSemiBold16,
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
                                      text: "Black",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 1, top: 10),
                          child: Container(
                            height: 36,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomIconButton(
                                  height: 36,
                                  width: 36,
                                  onTap: () {
                                    if (_itemCount > 1)
                                      setState(() {
                                        if (_itemCount <= 0) {
                                          _itemCount = 0;
                                        } else {
                                          _itemCount--;
                                        }
                                      });
                                  },
                                  variant: IconButtonVariant.OutlineGray90063,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgMenuBlueGray200,
                                    color: AppColors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 16,
                                    top: 10,
                                  ),
                                  child: Text(
                                    "${_itemCount}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtMetropolisMedium14Gray100,
                                  ),
                                ),
                                CustomIconButton(
                                  height: 36,
                                  width: 36,
                                  margin: EdgeInsets.only(
                                    left: 16,
                                  ),
                                  onTap: () {
                                    setState(() => _itemCount++);
                                  },
                                  variant: IconButtonVariant.OutlineGray90063,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgPlus,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 20),
                                  child: Text(
                                    "${widget.homeNewListModel.new_price}\$",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
                                    style:
                                        AppStyle.txtMetropolisMedium14Gray100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     _itemCount != 0
                        //         ? new IconButton(
                        //             icon: new Icon(Icons.remove),
                        //             onPressed: () =>
                        //                 setState(() => _itemCount--),
                        //           )
                        //         : new Container(),
                        //     new Text(_itemCount.toString()),
                        //     new IconButton(
                        //         icon: new Icon(Icons.add),
                        //         onPressed: () => setState(() => _itemCount++))
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            onTap: (() {
              PopupMenuButton(

                itemBuilder: ((context) => [
                      PopupMenuItem(
                        value: 0,
                        child: Text("Add to favorites")),
                      PopupMenuItem(
                        value: 1,
                        child: Text("Delete from the list")),
                    ]),
              );
            }),
            svgPath: ImageConstant.imgOverflowmenu,
            height: 40,
            width: 40,
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
// class MybagItemWidget extends StatefulWidget {
//   MybagItemWidget({Key? key, required this.homeNewListModel}) : super(key: key);
//   HomeNewListModel homeNewListModel;

//   @override
//   State<MybagItemWidget> createState() => _MybagItemWidgetState();
// }

// class _MybagItemWidgetState extends State<MybagItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 104,
//       width: 346,
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               margin: EdgeInsets.only(
//                 right: 3,
//               ),
//               decoration: AppDecoration.outlineBlack90014.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder8,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 104,
//                     width: 104,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         CustomImageView(
//                           imagePath: "${widget.homeNewListModel.imageurl}",
//                           height: 104,
//                           width: 104,
//                           radius: BorderRadius.only(
//                             topLeft: Radius.circular(
//                               8,
//                             ),
//                             bottomLeft: Radius.circular(8),
//                           ),
//                           alignment: Alignment.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 11,
//                       top: 10,
//                       bottom: 12,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Pullover",
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           style: AppStyle.txtMetropolisSemiBold16,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 1,
//                             top: 4,
//                           ),
//                           child: Row(
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: "Color:",
//                                       style: TextStyle(
//                                         color: ColorConstant.blueGray200,
//                                         fontSize: 11,
//                                         fontFamily: 'Metropolis',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: " ",
//                                       style: TextStyle(
//                                         color: ColorConstant.gray500,
//                                         fontSize: 11,
//                                         fontFamily: 'Metropolis',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: "Black",
//                                       style: TextStyle(
//                                         color: ColorConstant.gray100,
//                                         fontSize: 11,
//                                         fontFamily: 'Metropolis',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.left,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 13,
//                                 ),
//                                 child: RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "Size:",
//                                         style: TextStyle(
//                                           color: ColorConstant.blueGray200,
//                                           fontSize: 11,
//                                           fontFamily: 'Metropolis',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: " ",
//                                         style: TextStyle(
//                                           color: ColorConstant.gray500,
//                                           fontSize: 11,
//                                           fontFamily: 'Metropolis',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: "L",
//                                         style: TextStyle(
//                                           color: ColorConstant.gray100,
//                                           fontSize: 11,
//                                           fontFamily: 'Metropolis',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 1,
//                             top: 10,
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomIconButton(
//                                 height: 36,
//                                 width: 36,
//                                 variant: IconButtonVariant.OutlineGray90063,
//                                 child: CustomImageView(
//                                   svgPath: ImageConstant.imgMenuBlueGray200,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 16,
//                                   top: 10,
//                                 ),
//                                 child: Text(
//                                   "1",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtMetropolisMedium14Gray100,
//                                 ),
//                               ),
//                               CustomIconButton(
//                                 height: 36,
//                                 width: 36,
//                                 margin: EdgeInsets.only(
//                                   left: 16,
//                                 ),
//                                 variant: IconButtonVariant.OutlineGray90063,
//                                 child: CustomImageView(
//                                   svgPath: ImageConstant.imgPlus,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 60,
//                                   top: 10,
//                                 ),
//                                 child: Text(
//                                   "51\$",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppStyle.txtMetropolisMedium14Gray100,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           CustomImageView(
//             svgPath: ImageConstant.imgOverflowmenu,
//             height: 40,
//             width: 40,
//             alignment: Alignment.topRight,
//           ),
//         ],
//       ),
//     );
//   }
// }
