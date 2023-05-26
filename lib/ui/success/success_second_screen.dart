import 'package:e_commerce/ui/bag/bagscreen.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessSecondScreen extends StatefulWidget {
  static const successSecondScreen = "/successSecondScreen";
  const SuccessSecondScreen({Key? key}) : super(key: key);

  @override
  State<SuccessSecondScreen> createState() => _SuccessSecondScreenState();
}

class _SuccessSecondScreenState extends State<SuccessSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 192),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 213,
                        width: 208,
                        child: SvgPicture.asset(
                          "assets/images/img_bags.svg",
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 49),
                  child: Column(
                    children: [
                      Container(
                          child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Success!",
                          style:
                              TextStyle(fontSize: 34, color: AppColors.white),
                        ),
                      )),
                      Container(
                          child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 55, right: 55, top: 18),
                          child: Text(
                            "Your order will be delivered soon. Thank you for choosing our app!",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 90),
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
                          ECToast.instance
                              .showSuccess(context, "Order successfull");
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Base()),
                              (Route route) => route == null);
                        },
                        child: Text(
                          "Continue shopping",
                          style: TextStyle(fontSize: 14),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
