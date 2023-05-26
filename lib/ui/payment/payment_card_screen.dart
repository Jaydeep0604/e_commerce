import 'package:e_commerce/ui/address/shipping_address.dart';
import 'package:e_commerce/ui/bag/bag_checkout_screen.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/svg.dart';

class PaymentCardScreen extends StatefulWidget {
  static const paymentCardScreen = "/paymentCardScreen";
  const PaymentCardScreen({Key? key}) : super(key: key);

  @override
  State<PaymentCardScreen> createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  bool value = false;
  bool value2 = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

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
                isNeedCenterTitle: "Payment methods",
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
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  CreditCardWidget(
                    glassmorphismConfig:
                        useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Axis Bank',
                    frontCardBorder: !useGlassMorphism
                        ? Border.all(color: Colors.grey)
                        : null,
                    backCardBorder: !useGlassMorphism
                        ? Border.all(color: Colors.grey)
                        : null,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: AppColors.darkColor,
                    backgroundImage: useBackgroundImage ? '' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: SvgPicture.asset(
                          'assets/images/img_globe.svg',
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16, top: 25),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.primaryColor,
                            side: BorderSide(color: AppColors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            value: this.value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BagCheckoutScreen()));
                              });
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Use as default payment method",
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, top: 40),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: AppColors.backgroundColor,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0))),
                                  isDismissible: false,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    final MediaQueryData mediaQueryData =
                                        MediaQuery.of(context);

                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Padding(
                                        padding: mediaQueryData.viewInsets,
                                        child: ScrollConfiguration(
                                          behavior: NoGlow(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                CreditCardForm(
                                                  formKey: formKey,
                                                  obscureCvv: false,
                                                  obscureNumber: false,
                                                  cardNumber: cardNumber,
                                                  cvvCode: cvvCode,
                                                  isHolderNameVisible: true,
                                                  isCardNumberVisible: true,
                                                  isExpiryDateVisible: true,
                                                  cardHolderName:
                                                      cardHolderName,
                                                  expiryDate: expiryDate,
                                                  themeColor: Colors.blue,
                                                  textColor: Colors.white,
                                                  cardNumberDecoration:
                                                      InputDecoration(
                                                    labelText: 'Number',
                                                    hintText:
                                                        'XXXX XXXX XXXX XXXX',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.white),
                                                    labelStyle: const TextStyle(
                                                        color: Colors.white),
                                                    focusedBorder: border,
                                                    enabledBorder: border,
                                                  ),
                                                  expiryDateDecoration:
                                                      InputDecoration(
                                                    hintStyle: const TextStyle(
                                                        color: Colors.white),
                                                    labelStyle: const TextStyle(
                                                        color: Colors.white),
                                                    focusedBorder: border,
                                                    enabledBorder: border,
                                                    labelText: 'Expired Date',
                                                    hintText: 'XX/XX',
                                                  ),
                                                  cvvCodeDecoration:
                                                      InputDecoration(
                                                    hintStyle: const TextStyle(
                                                        color: Colors.white),
                                                    labelStyle: const TextStyle(
                                                        color: Colors.white),
                                                    focusedBorder: border,
                                                    enabledBorder: border,
                                                    labelText: 'CVV',
                                                    hintText: 'XXX',
                                                  ),
                                                  cardHolderDecoration:
                                                      InputDecoration(
                                                    hintStyle: const TextStyle(
                                                        color: Colors.white),
                                                    labelStyle: const TextStyle(
                                                        color: Colors.white),
                                                    focusedBorder: border,
                                                    enabledBorder: border,
                                                    labelText: 'Card Holder',
                                                  ),
                                                  onCreditCardModelChange:
                                                      onCreditCardModelChange,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: _onValidate,
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 15),
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'ADD CARD',
                                                      style: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 14,
                                                        package:
                                                            'flutter_credit_card',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                                  });
                            },
                            icon: Image.asset(
                              "assets/icons/add.png",
                              fit: BoxFit.cover,
                              color: AppColors.blck,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //  Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.only(left: 16),
          //       child: Text(
          //         "Your payment cards",
          //         style: TextStyle(fontSize: 16, color: AppColors.white),
          //       ),
          //     ),
          //     Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, top: 29),
          //         child: Container(
          //             height: 216,
          //             decoration: BoxDecoration(
          //               color: Colors.transparent,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             width: MediaQuery.of(context).size.width,
          //             child: Image.asset(
          //               "assets/images/Card.png",
          //               fit: BoxFit.cover,
          //             ))),
          //     Padding(
          //         padding: EdgeInsets.only(left: 16, top: 25),
          //         child: Row(
          //           children: [
          //             Checkbox(
          //               activeColor: AppColors.primaryColor,
          //               side: BorderSide(color: AppColors.white),
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(3)),
          //               value: this.value,
          //               onChanged: (value) {
          //                 setState(() {
          //                   this.value = value!;
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => BagCheckoutScreen()));
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               width: 5,
          //             ),
          //             Text(
          //               "Use as default payment method",
          //               style: TextStyle(fontSize: 16, color: AppColors.white),
          //             ),
          //           ],
          //         )),
          //     Padding(
          //         padding: EdgeInsets.only(left: 16, right: 16, top: 29),
          //         child: Container(
          //             height: 216,
          //             decoration: BoxDecoration(
          //               color: Colors.transparent,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             width: MediaQuery.of(context).size.width,
          //             child: Image.asset(
          //               "assets/images/Card 2.png",
          //               fit: BoxFit.cover,
          //             ))),
          //     Padding(
          //         padding: EdgeInsets.only(left: 16, top: 25),
          //         child: Row(
          //           children: [
          //             Checkbox(
          //               activeColor: AppColors.primaryColor,
          //               side: BorderSide(color: AppColors.white),
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(3)),
          //               value: this.value2,
          //               onChanged: (value2) {
          //                 setState(() {
          //                   this.value2 = value2!;
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => BagCheckoutScreen()));
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               width: 5,
          //             ),
          //             Text(
          //               "Use as default payment method",
          //               style: TextStyle(fontSize: 16, color: AppColors.white),
          //             ),
          //           ],
          //         )),
          //     Align(
          //       alignment: Alignment.centerRight,
          //       child: Padding(
          //         padding: const EdgeInsets.only(right: 16, top: 40),
          //         child: Container(
          //           height: 36,
          //           width: 36,
          //           decoration: BoxDecoration(
          //               color: AppColors.white,
          //               borderRadius: BorderRadius.circular(50)),
          //           child: IconButton(
          //               onPressed: () {},
          //               icon: Image.asset(
          //                 "assets/icons/add.png",
          //                 fit: BoxFit.cover,
          //                 color: AppColors.blck,
          //               )),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 20,
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
