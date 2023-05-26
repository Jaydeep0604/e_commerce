import 'package:e_commerce/model/order_model.dart';
import 'package:e_commerce/ui/myorder/order_details_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrderDeliveredWidget extends StatefulWidget {
  OrderDeliveredWidget({Key? key, required this.orderModel}) : super(key: key);
  OrderModel orderModel;
  @override
  State<OrderDeliveredWidget> createState() => _OrderDeliveredWidgetState();
}

class _OrderDeliveredWidgetState extends State<OrderDeliveredWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.orderModel.status.contains("Delivered"))
          Container(
            height: 164,
            decoration: BoxDecoration(
                color: AppColors.darkColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Order ${widget.orderModel.order_id}",
                        style: TextStyle(color: AppColors.white),
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "05-12-2019",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Tracking number:",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        "${widget.orderModel.tracking_number}",
                        style: TextStyle(color: AppColors.white),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Quantity:",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text(
                              "${widget.orderModel.quntity}",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Total Amount:",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text(
                              "${widget.orderModel.total_amount}\$",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetailsScreen()));
                        },
                        child: Container(
                          height: 36,
                          width: 98,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              // color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Details",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                      if (widget.orderModel.status.contains("Delivered"))
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${widget.orderModel.status}",
                            style: TextStyle(color: AppColors.successColor),
                          ),
                        )),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class OrderCancelledWidget extends StatefulWidget {
  OrderCancelledWidget({Key? key, required this.orderModel}) : super(key: key);
  OrderModel orderModel;

  @override
  State<OrderCancelledWidget> createState() => _OrderCancelledWidgetState();
}

class _OrderCancelledWidgetState extends State<OrderCancelledWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.orderModel.status.contains("Cancelled"))
          Container(
            height: 164,
            decoration: BoxDecoration(
                color: AppColors.darkColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Order ${widget.orderModel.order_id}",
                        style: TextStyle(color: AppColors.white),
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "05-12-2019",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Tracking number:",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        "${widget.orderModel.tracking_number}",
                        style: TextStyle(color: AppColors.white),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Quantity:",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text(
                              "${widget.orderModel.quntity}",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Total Amount:",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text(
                              "${widget.orderModel.total_amount}\$",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetailsScreen()));
                        },
                        child: Container(
                          height: 36,
                          width: 98,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              // color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Details",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                      if (widget.orderModel.status.contains("Cancelled"))
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${widget.orderModel.status}",
                            style: TextStyle(color: AppColors.errorColor),
                          ),
                        ))
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class OrderProcessingWidget extends StatefulWidget {
  OrderProcessingWidget({Key? key, required this.orderModel}) : super(key: key);
  OrderModel orderModel;

  @override
  State<OrderProcessingWidget> createState() => _OrderProcessingWidgetState();
}

class _OrderProcessingWidgetState extends State<OrderProcessingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.orderModel.status.contains("Processing"))
          Container(
            height: 164,
            decoration: BoxDecoration(
                color: AppColors.darkColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Order ${widget.orderModel.order_id}",
                        style: TextStyle(color: AppColors.white),
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "05-12-2019",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Tracking number:",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        "${widget.orderModel.tracking_number}",
                        style: TextStyle(color: AppColors.white),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Quantity:",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text(
                              "${widget.orderModel.quntity}",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Total Amount:",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text(
                              "${widget.orderModel.total_amount}\$",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetailsScreen()));
                        },
                        child: Container(
                          height: 36,
                          width: 98,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              // color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Details",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                      if (widget.orderModel.status.contains("Processing"))
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${widget.orderModel.status}",
                            style: TextStyle(color: AppColors.greyColor),
                          ),
                        ))
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
