import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CustomAppBar extends PreferredSize {
  final Widget child;
  final BuildContext context;
  CustomAppBar({required this.child, required this.context})
      : super(
            child: child,
            preferredSize: Size.fromHeight(
                MediaQuery.of(context).padding.top + kToolbarHeight));

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).padding.top + kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 16,
          //       color: Color.fromRGBO(0, 0, 0, 0.16),
          //       offset: Offset(0, 8))
          // ],
          color: Colors.transparent,
          ),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class CustomAppBarWithBottom extends PreferredSize {
  final Widget child;
  final BuildContext context;
  CustomAppBarWithBottom({required this.child, required this.context})
      : super(
            child: child,
            preferredSize: Size.fromHeight(
                MediaQuery.of(context).padding.top + kToolbarHeight));

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).padding.top + kToolbarHeight + 46);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 16,
          //       color: Color.fromRGBO(0, 0, 0, 0.16),
          //       offset: Offset(0, 8))
          // ],
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0))),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}
// class CustomAppBarMyOrderWithBottom extends PreferredSize {
//   final Widget child;
//   final BuildContext context;
//   CustomAppBarMyOrderWithBottom({required this.child, required this.context})
//       : super(
//             child: child,
//             preferredSize: Size.fromHeight(
//                 MediaQuery.of(context).padding.top + kToolbarHeight));

//   @override
//   Size get preferredSize =>
//       Size.fromHeight(MediaQuery.of(context).padding.top + kToolbarHeight + 78);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           // boxShadow: [
//           //   BoxShadow(
//           //       blurRadius: 16,
//           //       color: Color.fromRGBO(0, 0, 0, 0.16),
//           //       offset: Offset(0, 8))
//           // ],
//           color: Colors.transparent,
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(0),
//               bottomRight: Radius.circular(0))),
//       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//       height: preferredSize.height,
//       alignment: Alignment.center,
//       child: child,
//     );
//   }
// }
