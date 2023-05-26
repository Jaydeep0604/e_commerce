import 'package:date_field/date_field.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/register/registerscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/ECEditText.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  static const settingScreen = "/settingScreen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _obsecureText = true;
  bool saleSwitchValue = true;
  bool arrivalsSwitchValue = false;
  bool deliverySwitchValue = false;
  late DateTimeField selectedData;

  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBarWithBottom(
          context: context,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomAppContent(
                      isNeedCenterTitle: "",
                      isNeedLeading: false,
                      isNeedProfile: true,
                      leadingIcon: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            onTap: () async {
                              // bool isPop = await navigatorKeys[
                              //         Base.getCurrentTab(context)]!
                              //     .currentState!
                              //     .maybePop();
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
                      action: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () async {
                              // bool isPop = await navigatorKeys[
                              //         Base.getCurrentTab(context)]!
                              //     .currentState!
                              //     .maybePop();
                              // if (!isPop) {
                              //   Base.switchTab(context, MyTabItem.home);
                              // }
                              ECToast.instance
                                  .showError(context, "Comming soon...");
                            },
                            child: Image.asset(
                              "assets/icons/search_icon.png",
                              width: 20,
                            ),
                          )))),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 14),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 34, color: AppColors.whiteColor),
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
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 21, right: 16, left: 16),
                child: Column(
                  children: [
                    ECEditText(
                      // textEditingController: nameCtr,
                      textInputType: TextInputType.text,
                      hint: "Enter Your Name",
                      // enabled:
                      //     registerModel?.firstName == null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                        FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                            allow: true),
                        LengthLimitingTextInputFormatter(25)
                      ],
                      validator: (value) {
                        if (value?.trimLeft().trimRight().isEmpty ?? true) {
                          return "Please enter your first name";
                        }
                        if (value != null && value.length < 3) {
                          return "First name must be minimum 3 characters";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 21, right: 16, left: 16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: DateTimeFormField(
                        decoration: const InputDecoration(
                          hintText: "Date of Birth",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          fillColor: AppColors.darkColor,
                          filled: true,
                        ),
                        dateTextStyle: TextStyle(color: AppColors.white),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          print(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 55),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Password",
                      style: TextStyle(color: AppColors.white),
                    )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (() {
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

                                return Padding(
                                  padding: mediaQueryData.viewInsets,
                                  child: ScrollConfiguration(
                                    behavior: NoGlow(),
                                    child: GestureDetector(
                                      onTap: (() {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      }),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                top: 20,
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Password Change",
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 15, right: 16, left: 16),
                                              child: Column(
                                                children: [
                                                  ECEditText(
                                                    // controller: password,
                                                    hint: "Old Password",
                                                    obsecureText: _obsecureText,
                                                    textInputType: TextInputType
                                                        .visiblePassword,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(' '),
                                                      LengthLimitingTextInputFormatter(
                                                          16)
                                                    ],
                                                    validator: (value) {
                                                      if (value == "" ||
                                                          (value
                                                                  ?.trim()
                                                                  .isEmpty ??
                                                              true)) {
                                                        return "Please enter old password";
                                                      }
                                                      return null;
                                                    },
                                                    suffixIcon: GestureDetector(
                                                      onTap: _toggleObscured,
                                                      child: Transform.scale(
                                                        scale: 0.5,
                                                        child: ImageIcon(
                                                          _obsecureText
                                                              ? AssetImage(
                                                                  "assets/icons/hide.png",
                                                                )
                                                              : AssetImage(
                                                                  "assets/icons/view.png",
                                                                ),
                                                          size: 12,
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16, top: 14),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  "Forgot Password",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.greyColor,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 15, right: 16, left: 16),
                                              child: Column(
                                                children: [
                                                  ECEditText(
                                                    // controller: password,
                                                    hint: "New Password",
                                                    obsecureText: _obsecureText,
                                                    textInputType: TextInputType
                                                        .visiblePassword,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(' '),
                                                      LengthLimitingTextInputFormatter(
                                                          16)
                                                    ],
                                                    validator: (value) {
                                                      if (value == "" ||
                                                          (value
                                                                  ?.trim()
                                                                  .isEmpty ??
                                                              true)) {
                                                        return "Please enter new password";
                                                      }
                                                      return null;
                                                    },
                                                    suffixIcon: GestureDetector(
                                                      onTap: _toggleObscured,
                                                      child: Transform.scale(
                                                        scale: 0.5,
                                                        child: ImageIcon(
                                                          _obsecureText
                                                              ? AssetImage(
                                                                  "assets/icons/hide.png",
                                                                )
                                                              : AssetImage(
                                                                  "assets/icons/view.png",
                                                                ),
                                                          size: 12,
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 15, right: 16, left: 16),
                                              child: Column(
                                                children: [
                                                  ECEditText(
                                                    // controller: password,
                                                    hint: "Repeat New Password",
                                                    obsecureText: _obsecureText,
                                                    textInputType: TextInputType
                                                        .visiblePassword,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(' '),
                                                      LengthLimitingTextInputFormatter(
                                                          16)
                                                    ],
                                                    validator: (value) {
                                                      if (value == "" ||
                                                          (value
                                                                  ?.trim()
                                                                  .isEmpty ??
                                                              true)) {
                                                        return "Please enter Repeat password";
                                                      }
                                                      return null;
                                                    },
                                                    suffixIcon: GestureDetector(
                                                      onTap: _toggleObscured,
                                                      child: Transform.scale(
                                                        scale: 0.5,
                                                        child: ImageIcon(
                                                          _obsecureText
                                                              ? AssetImage(
                                                                  "assets/icons/hide.png",
                                                                )
                                                              : AssetImage(
                                                                  "assets/icons/view.png",
                                                                ),
                                                          size: 12,
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  bottom: 20),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 48,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: TextButton(
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .primaryColor,
                                                        primary:
                                                            AppColors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    50))),
                                                    onPressed: () =>
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        RegisterScreen())).then(
                                                            (value) {
                                                          // formKey.currentState?.reset();
                                                        }),
                                                    child: Text("SAVE PASSWORD")),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                        child: Text(
                          "Change",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 21, right: 16, left: 16),
                child: Column(
                  children: [
                    ECEditText(
                      // controller: password,
                      hint: "Enter Password",
                      obsecureText: _obsecureText,
                      textInputType: TextInputType.visiblePassword,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(' '),
                        LengthLimitingTextInputFormatter(16)
                      ],
                      validator: (value) {
                        if (value == "" || (value?.trim().isEmpty ?? true)) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 55),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 23),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Sales",
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoSwitch(
                        // This bool value toggles the switch.
                        value: saleSwitchValue,
                        thumbColor: saleSwitchValue
                            ? AppColors.successColor
                            : AppColors.switchOffColor,
                        activeColor: AppColors.darkColor,
                        onChanged: (bool? value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            saleSwitchValue = value ?? false;
                          });
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 23),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "New arrivals",
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoSwitch(
                        // This bool value toggles the switch.
                        value: arrivalsSwitchValue,
                        thumbColor: arrivalsSwitchValue
                            ? AppColors.successColor
                            : AppColors.switchOffColor,
                        activeColor: AppColors.darkColor,
                        onChanged: (bool? value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            arrivalsSwitchValue = value ?? false;
                          });
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 23, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Delivery status changes",
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoSwitch(
                        value: deliverySwitchValue,
                        thumbColor: deliverySwitchValue
                            ? AppColors.successColor
                            : AppColors.switchOffColor,
                        activeColor: AppColors.darkColor,
                        trackColor: AppColors.darkColor,
                        onChanged: (bool? value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            deliverySwitchValue = value ?? false;
                          });
                        },
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
