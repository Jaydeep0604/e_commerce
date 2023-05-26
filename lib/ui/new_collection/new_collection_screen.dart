import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:flutter/material.dart';

class NewCollectionScreen extends StatefulWidget {
  static const newCollectionScreen = "/newCollectionScreen";
  const NewCollectionScreen({Key? key}) : super(key: key);

  @override
  State<NewCollectionScreen> createState() => _NewCollectionScreenState();
}

class _NewCollectionScreenState extends State<NewCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
            child: Column(
          children: [
            InkWell(
              onTap: () {
                ECToast.instance.showError(context, "Comming soon...");
              },
              child: Container(
                height: 350,
                width: 375,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/main.png",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 300, left: 110),
                      child: Text(
                        "New collection",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                            fontSize: 34),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 374,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ECToast.instance.showError(context, "Comming soon...");
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Center(
                            child: Container(
                              color: AppColors.blck,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Summer\nsale",
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Image.asset(
                                "assets/images/new_collection.png",
                                fit: BoxFit.cover),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ECToast.instance.showError(context, "Comming soon...");
                      },
                      child: Container(
                        height: 374,
                        child: Image.asset(
                          "assets/images/new_collection2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
