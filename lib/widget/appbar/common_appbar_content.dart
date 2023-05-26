import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppContent extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedProfile;
  final bool isNeedLeading;
  final String isNeedCenterTitle;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  CustomAppContent(
      {required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedProfile = false,
      this.leadingIcon,
      Key? key,
      this.scaffoldkey,
      this.action,
      this.globalKey})
      : super(key: key);

  @override
  _CustomAppContentState createState() => _CustomAppContentState();
}

class _CustomAppContentState extends State<CustomAppContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isNeedLeading
              ? SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.blck,
                        size: 30,
                      ),
                    ),
                  ),
                )
              : widget.leadingIcon != null
                  ? widget.leadingIcon!
                  : SizedBox(
                      width: 40,
                    ),
          if (widget.isNeedCenterTitle != null)
            Expanded(
              child: Container(
                child: Text(
                  widget.isNeedCenterTitle.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      // ?.copyWith(fontFamily: AVMFontFamily.poppinsSeiBold)
                      ?.copyWith(color: Colors.white),
                  // style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.white,
                  //     fontFamily: "Poppins",
                  //     // fontWeight: FontWeight.bold,
                  //     letterSpacing: 1),
                ),
              ),
            ),
          widget.isNeedProfile
              ? widget.action!
              // child: UserCircleAvatar(
              //   scaffoldKey: widget.scaffoldkey,
              //   globalKey: widget.globalKey,
              // )
              // )
              : SizedBox(width: 40)
        ],
      ),
    );
  }
}

class HomeCustomAppContent extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedProfile;
  final bool isNeedLeading;
  final String isNeedCenterTitle;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  HomeCustomAppContent(
      {required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedProfile = false,
      this.leadingIcon,
      Key? key,
      this.scaffoldkey,
      this.action,
      this.globalKey})
      : super(key: key);

  @override
  _HomeCustomAppContentState createState() => _HomeCustomAppContentState();
}

class _HomeCustomAppContentState extends State<HomeCustomAppContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isNeedLeading
              ? SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.blck,
                        size: 30,
                      ),
                    ),
                  ),
                )
              : widget.leadingIcon != null
                  ? widget.leadingIcon!
                  : SizedBox(
                      width: 40,
                    ),
          if (widget.isNeedCenterTitle != null)
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  widget.isNeedCenterTitle.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      // ?.copyWith(fontFamily: AVMFontFamily.poppinsSeiBold)
                      ?.copyWith(color: Colors.white),
                  // style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.white,
                  //     fontFamily: "Poppins",
                  //     // fontWeight: FontWeight.bold,
                  //     letterSpacing: 1),
                ),
              ),
            ),
          widget.isNeedProfile
              ? widget.action!
              // child: UserCircleAvatar(
              //   scaffoldKey: widget.scaffoldkey,
              //   globalKey: widget.globalKey,
              // )
              // )
              : SizedBox(width: 40)
        ],
      ),
    );
  }
}

class LoginCustomAppContent extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldkey;
  final bool isNeedProfile;
  final bool isNeedLeading;
  final String isNeedCenterTitle;
  final Widget? leadingIcon;
  final GlobalKey? globalKey;
  final Widget? action;
  LoginCustomAppContent(
      {required this.isNeedCenterTitle,
      this.isNeedLeading = false,
      this.isNeedProfile = false,
      this.leadingIcon,
      Key? key,
      this.scaffoldkey,
      this.action,
      this.globalKey})
      : super(key: key);

  @override
  _LoginCustomAppContentState createState() => _LoginCustomAppContentState();
}

class _LoginCustomAppContentState extends State<LoginCustomAppContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isNeedLeading
              ? SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.blck,
                        size: 30,
                      ),
                    ),
                  ),
                )
              : widget.leadingIcon != null
                  ? widget.leadingIcon!
                  : SizedBox(
                      width: 40,
                    ),
          if (widget.isNeedCenterTitle != null)
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(left: 110),
                child: Text(
                  widget.isNeedCenterTitle.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      // ?.copyWith(fontFamily: AVMFontFamily.poppinsSeiBold)
                      ?.copyWith(color: Colors.white),
                  // style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.white,
                  //     fontFamily: "Poppins",
                  //     // fontWeight: FontWeight.bold,
                  //     letterSpacing: 1),
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child: widget.isNeedProfile
                ? widget.action!
                // child: UserCircleAvatar(
                //   scaffoldKey: widget.scaffoldkey,
                //   globalKey: widget.globalKey,
                // )
                // )
                : SizedBox(width: 40),
          )
        ],
      ),
    );
  }
}
