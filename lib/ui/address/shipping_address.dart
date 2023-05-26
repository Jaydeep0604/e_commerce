import 'package:e_commerce/model/address_model.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/address_widget.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';

class ShippinAddress extends StatefulWidget {
  static const shippinAddress = "/shippinAddress";
  const ShippinAddress({Key? key}) : super(key: key);

  @override
  State<ShippinAddress> createState() => _ShippinAddressState();
}

class _ShippinAddressState extends State<ShippinAddress> {
  bool value = false;
  List<AddressModel> item = [
    AddressModel("id", "Jane Doe",
        "3 Newbridge Court\nChino Hills, CA 91709, United States"),
    AddressModel("id", "Jane Doe",
        "3 Newbridge Court\nChino Hills, CA 91709, United States"),
    AddressModel("id", "Jane Doe",
        "3 Newbridge Court\nChino Hills, CA 91709, United States")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        context: context,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomAppContent(
                isNeedCenterTitle: "Shipping Addresses",
                isNeedLeading: false,
                isNeedProfile: false,
                leadingIcon: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () async {
                        // bool isPop =
                        //     await navigatorKeys[Base.getCurrentTab(context)]!
                        //         .currentState!
                        //         .maybePop();
                        // if (!isPop) {
                        //   Base.switchTab(context, MyTabItem.home);
                        // }
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/icons/back_icon.png",
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 22, right: 14),
            child: Expanded(
              child: GestureDetector(
                onTap: (() {
                  FocusManager.instance.primaryFocus?.unfocus();
                }),
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => "SpecialsCombosScreen"()),
                          // );
                        },
                        child: AddressWidget(addressModel: item[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16,top: 40),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/add.png",
                      fit: BoxFit.cover,
                      color: AppColors.blck,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
