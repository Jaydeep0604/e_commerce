import 'package:e_commerce/ui/login/loginscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/widget/ECEditText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ForgrtScreen extends StatefulWidget {
  static const forgrtScreen = "/forgrtScreen";
  const ForgrtScreen({Key? key}) : super(key: key);

  @override
  State<ForgrtScreen> createState() => _ForgrtScreenState();
}

class _ForgrtScreenState extends State<ForgrtScreen> {
  bool emailicon = false;
  bool emailicon1 = true;
  late TextEditingController emailCtr = TextEditingController();
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
                          "Forgot password",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 34),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 87, right: 17),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        // height: 34,width: 94,
                        child: Text(
                          "Please, enter your email address. You will receive a link to create a new password via email.",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 14),
                        ),
                      ),
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
                                return "Not a valid email address. Should be your@email.com";
                              }
                              return null;
                            },
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Transform.scale(
                                  scale: 0.9,
                                  child: emailicon
                                      ? SvgPicture.asset('assets/images/img_close.svg',)
                                      : emailicon1
                                          ? null
                                          : SvgPicture.asset('assets/images/img_checkmark.svg')),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: 20, left: 20, top: 55, bottom: 50),
                    alignment: Alignment.topRight,
                    child: FlatButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 48,
                        color: AppColors.primaryColor,
                        disabledColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Text('SEND',
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
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
