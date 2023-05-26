import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/success/success_second_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  static const successScreen="/successScreen";
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/img_success.png",
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Column(
              children: [
                Container(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Success!",
                    style: TextStyle(fontSize: 34),
                  ),
                )),
                Container(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 55, right: 55, top: 18),
                    child: Text(
                      "Your order will be delivered soon. Thank you for choosing our app!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(right: 120, left: 120, top: 24),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 27,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            primary: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessSecondScreen()));
                        },
                        child: Text("Continue shopping",style: TextStyle(fontSize: 10),)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
