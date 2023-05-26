import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/forgot/forgetscreen.dart';
import 'package:e_commerce/ui/register/registerscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/ECEditText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const loginScreen = "/loginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecureText = true;
  bool emailicon = false;
  bool emailicon1 = true;
  late TextEditingController emailCtr = TextEditingController();
  late TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailCtr.addListener(() {
      if (!RegExp(r"^(?:\d{10}|\w+@\w+\.\w{2,3})$").hasMatch(emailCtr.text)) {
        emailicon = true;
        emailicon1 = true;
      } else if (emailCtr.text.isEmpty) {
        '';
      } else {
        emailicon = false;
        emailicon1 = false;
      }
      setState(() {});
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   validateField();
  // }

  // void validateField() {
  //   emailCtr.addListener(() {
  //     if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //             .hasMatch(emailCtr.text.toString() ?? "") ==
  //         true) {
  //       showSuffix = true;
  //     } else if (!RegExp(
  //                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //             .hasMatch(emailCtr.text.toString() ?? "") ==
  //         false) {
  //       showSuffix = false;
  //     } else {
  //       showSuffix = false;
  //     }
  //     setState(() {});
  //   });
  // }

  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusManager.instance.primaryFocus?.unfocus();
      }),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 95),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        // height: 34,width: 94,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 34),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 73, right: 16, left: 16),
                    child: Column(
                      children: [
                        ECEditText(
                          hint: "Enter Email Address",
                          textEditingController: emailCtr,
                          // obsecureText: _suffix,
                          // lable: "Email",
                          // controller: emailCtr,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(60),
                            FilteringTextInputFormatter.deny(" "),
                            FilteringTextInputFormatter.deny("[]"),
                            FilteringTextInputFormatter.deny("["),
                            FilteringTextInputFormatter.deny("]"),
                            FilteringTextInputFormatter.deny("^"),
                            FilteringTextInputFormatter.deny(""),
                            FilteringTextInputFormatter.deny("`"),
                            FilteringTextInputFormatter.deny("/"),
                            FilteringTextInputFormatter.deny("\\"),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9a-zA-z._@]')),
                            FilteringTextInputFormatter.deny(RegExp(r"/"))
                          ],
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return "Please enter email address";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value ?? "")) {
                              return "Enter valid email address";
                            }
                            return null;
                          },
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Transform.scale(
                                scale: 0.9,
                                child: emailicon
                                    ? SvgPicture.asset(
                                        'assets/images/img_close.svg',
                                      )
                                    : emailicon1
                                        ? null
                                        : SvgPicture.asset(
                                            'assets/images/img_checkmark.svg')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 16, left: 16),
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
                            if (value == "" ||
                                (value?.trim().isEmpty ?? true)) {
                              return "Please enter password";
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
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {
                          // emailCtr.clear();
                          // password.clear();
                          // passwordMobile.clear();
                          // mobileCtr.clear();
                        });
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgrtScreen()))
                            .then((value) {
                          // formKey.currentState?.reset();
                        });
                      }),
                      child: Container(
                        padding: EdgeInsets.only(right: 16, top: 0.2),
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Forgot Your Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        // fontFamily: KSMFontFamily.robotoRgular,
                                        color: AppColors.whiteColor)),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                                child: Image.asset(
                              "assets/icons/arrow_right.png",
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 32),
                    alignment: Alignment.topRight,
                    child: FlatButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 48,
                        color: AppColors.primaryColor,
                        disabledColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Text('Login',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                // fontFamily: KSMFontFamily.robotoBold,
                                fontSize: 14,
                                color: AppColors.ordinarytextColor,
                                fontWeight: FontWeight.w700)),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Base()));
                        }
                        //  isLoading
                        //     ? null
                        //     : () {
                        //         FocusNode? focusNode =
                        //             FocusManager.instance.primaryFocus;
                        //         if (focusNode != null) {
                        //           if (focusNode.hasPrimaryFocus) {
                        //             focusNode.unfocus();
                        //           }
                        //         }

                        //},
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              primary: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterScreen())).then((value) {
                                // formKey.currentState?.reset();
                              }),
                          child: Text("Sign Up")),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // height: 34,width: 94,
                        child: Text(
                          "Or login with social account",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      height: 64,
                      width: 200,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ECToast.instance
                                  .showError(context, "Not developed");
                            },
                            child: Container(
                              height: 64,
                              width: 92,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Image.asset("assets/icons/google.png"),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 64,
                            width: 92,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Image.asset("assets/icons/facebook.png"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
