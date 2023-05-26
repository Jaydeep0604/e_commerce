import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ECEditText extends StatefulWidget {
  TextInputType? textInputType;
  String? hint;
  String? lable;
  TextEditingController? textEditingController;
  String? name;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  void Function()? onEditingComplete;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obsecureText;
  String? initialValue;
  List<TextInputFormatter>? inputFormatters;
  bool isEnabled;
  void Function(String)? onChanged;

  ECEditText(
      {this.textInputType,
      this.obsecureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.hint,
      this.lable,
      this.isEnabled = true,
      this.name,
      this.onChanged,
      this.inputFormatters,
      this.textInputAction,
      this.validator,
      this.initialValue,
      this.textEditingController,
      this.onEditingComplete,
      Key? key})
      : super(key: key);

  @override
  _ECEditTextState createState() => _ECEditTextState();
}

class _ECEditTextState extends State<ECEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        cursorColor: AppColors.primaryColor,
        validator: widget.validator,
        onEditingComplete: widget.onEditingComplete,
        initialValue: widget.initialValue,
        textInputAction: widget.textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.textInputType,
        obscureText: widget.obsecureText,
        enabled: widget.isEnabled,
        inputFormatters: widget.inputFormatters,
        
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          // fontFamily: AVMFontFamily.poppinsRgular
        ),
        decoration: InputDecoration(
            fillColor: AppColors.darkColor,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            errorStyle: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.red),
            helperStyle: Theme.of(context).textTheme.subtitle1,
            hintStyle: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: AppColors.whiteColor),
            hintText: widget.hint,
            labelText: widget.lable,
            // TextStyle(color: AppColors.whiteColor),
            filled: true,
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            label: widget.name != null ? Text(widget.name ?? "") : null,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.darkColor, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.darkColor, width: 0.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.darkColor, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.darkColor, width: 0.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.darkColor, width: 0.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.darkColor, width: 0.0),
            )),
      ),
    );
  }
}
