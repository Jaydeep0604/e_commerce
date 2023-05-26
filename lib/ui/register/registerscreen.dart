import 'package:e_commerce/ui/login/loginscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/ECEditText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  static const registerScreen="/registerScreen";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool emailicon = false;
  bool emailicon1 = true;
  bool nameicon = false;
  bool nameicon1 = true;
  late TextEditingController emailCtr = TextEditingController();
  late TextEditingController nameCtr = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameCtr.addListener(() {
      if (!RegExp(r"^.{3,}$").hasMatch(nameCtr.text)) {
        nameicon = true;
        nameicon1 = true;
      } else if (nameCtr.text.isEmpty) {
        "";
      } else {
        nameicon = false;
        nameicon1 = false;
      }
    });
    
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

  bool _obsecureText = true;
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
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              icon: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 35),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        // height: 34,width: 94,
                        child: Text(
                          "Sign Up",
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
                            textEditingController: nameCtr,
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
                              if (value?.trimLeft().trimRight().isEmpty ??
                                  true) {
                                return "Please enter your first name";
                              }
                              if (value != null && value.length < 3) {
                                return "First name must be minimum 3 characters";
                              }
                              return null;
                            },
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Transform.scale(
                                  scale: 0.9,
                                  child: nameicon
                                      ? Image.asset('assets/icons/close.png')
                                      : nameicon1
                                          ? null
                                          : Image.asset(
                                              'assets/icons/true.png')),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: Column(
                      children: [
                        ECEditText(
                            hint: "Enter Email Address",
                            // lable: "Email",
                            textEditingController: emailCtr,
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
                                      ? Image.asset('assets/icons/close.png')
                                      : emailicon1
                                          ? null
                                          : Image.asset(
                                              'assets/icons/true.png')),
                            )),
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
                                    builder: (context) => LoginScreen()))
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
                            Text('Already have an account?',
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
                        child: new Text('Sign Up',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                // fontFamily: KSMFontFamily.robotoBold,
                                fontSize: 14,
                                color: AppColors.ordinarytextColor,
                                fontWeight: FontWeight.w700)),
                        onPressed: () {}
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

                        //       },
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
                          "Or sign up with social account",
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
                          Container(
                            height: 64,
                            width: 92,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Image.asset("assets/icons/google.png"),
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
