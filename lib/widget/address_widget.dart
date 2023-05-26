import 'package:e_commerce/model/address_model.dart';
import 'package:e_commerce/ui/payment/payment_card_screen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatefulWidget {
  AddressWidget({Key? key, required this.addressModel}) : super(key: key);
  AddressModel addressModel;
  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: AppColors.darkColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.addressModel.name}",
                      style: TextStyle(fontSize: 14, color: AppColors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 23),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 14, color: AppColors.errorColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 28, top: 7),
              child: Text(
                "${widget.addressModel.address}",
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, top: 14),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.white,
                    side: BorderSide(color: AppColors.white,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    checkColor: AppColors.backgroundColor,
                    value: this.value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentCardScreen()));
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Use as the shipping address",
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
