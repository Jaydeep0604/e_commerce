import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/order_widget.dart';
import 'package:flutter/material.dart';

class CancelledScreen extends StatefulWidget {
  static const cancelledScreen = "/cancelledScreen";
  const CancelledScreen({Key? key}) : super(key: key);

  @override
  State<CancelledScreen> createState() => _CancelledScreenState();
}

class _CancelledScreenState extends State<CancelledScreen> {
  List<OrderModel> item = [
    // OrderModel("id", "order_id", "order_date", "tracking_number", "quntity", "total_amount", "status")
    OrderModel(
        "1", "№1947034", "05-12-2019", "IW3475453455", "3", "125", "Cancelled"),
    OrderModel(
        "1", "№1947035", "07-12-2019", "IW3475453455", "3", "124", "Cancelled"),
    OrderModel(
        "1", "№1947036", "09-12-2019", "IW3475453455", "3", "128", "Cancelled"),
    OrderModel(
        "1", "№1947036", "09-12-2019", "IW3475453455", "3", "128", "Delivered"),
    OrderModel("1", "№1947036", "09-12-2019", "IW3475453455", "3", "128",
        "Processing"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: ListView.separated(
          // physics: AlwaysScrollableScrollPhysics(
          // ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: item.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => CategoriesScreen()),
                  // );
                },
                child: OrderCancelledWidget(orderModel: item[index]));
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
