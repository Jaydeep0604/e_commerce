import 'package:clipboard/clipboard.dart';
import 'package:e_commerce/model/promo_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PromoWidget extends StatefulWidget {
  PromoWidget({Key? key, required this.promoModel}) : super(key: key);
  PromoModel promoModel;

  @override
  State<PromoWidget> createState() => _PromoWidgetState();
}

class _PromoWidgetState extends State<PromoWidget> {
  int _itemCount = 0;
  
   @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.darkColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: AppColors.sale_hotColor,
                    )),
              ),
              Container(
                height: 80,
                width: 80,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 34,
                    child: Row(
                      children: [
                        Text(
                          "${widget.promoModel.disscount}",
                          style:
                              TextStyle(fontSize: 34, color: AppColors.white),
                        ),
                        Column(
                          children: [
                            Text(
                              "%",
                              style: TextStyle(color: AppColors.white),
                            ),
                            Text(
                              "off",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
              )
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.promoModel.title}",
                          // textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: 14, color: AppColors.white),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${widget.promoModel.promoCode}",
                          // textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 11, color: AppColors.greyColor),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15, top: 12),
                            child: Text(
                                "${widget.promoModel.remainingDays} days remaining",
                                style: TextStyle(
                                    fontSize: 11, color: AppColors.greyColor)),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 14, top: 11),
                        child: Container(
                          height: 36,
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  primary: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: () {
                                FlutterClipboard.copy(
                                    widget.promoModel.promoCode.toString());
                                Navigator.pop(context);
                              },
                              child: Text("Copy")),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
