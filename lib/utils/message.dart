import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ECToast {
  static final ECToast instance = ECToast._internal();

  factory ECToast(BuildContext context) {
    return instance;
  }

  ECToast._internal();
  showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // showToastError(msg);
    // showTopFlash( context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // behavior: SnackBarBehavior.fixed,
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      backgroundColor: Colors.red[400],
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      // behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.horizontal,

      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  showSuccess(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "$msg",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      backgroundColor: AppColors.successColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 2000),
      elevation: 10,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ));
  }

  // showLoader() {
  //   return Center(
  //       child: LoadingAnimationWidget.threeArchedCircle(
  //     color: MyApp.themeNotifier.value == ThemeMode.dark
  //         ? Colors.white
  //         : Colors.black,
  //     size: 40,
  //   ));
  // }

  // void showLoading(BuildContext context) {
  //   SmartDialog.showLoading(
  //       animationType: SmartAnimationType.fade,
  //       backDismiss: true,
  //       useAnimation: true,
  //       usePenetrate: true,
  //       msg: "Loading");
  // }

  // void dismiss() {
  //   SmartDialog.dismiss();
  // }

  showToastSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.successColor,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  showToastError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
        fontSize: 12.0);
  }
}
