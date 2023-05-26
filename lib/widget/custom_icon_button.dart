import 'package:e_commerce/utils/color_constant.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        splashColor: Colors.transparent,
        iconSize: (height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: (width ?? 0),
          height: (height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll14:
        return EdgeInsets.all(
          14,
        );
      case IconButtonPadding.PaddingAll2:
        return EdgeInsets.all(
          2,
        );
      case IconButtonPadding.PaddingAll10:
        return EdgeInsets.all(
          10,
        );
      default:
        return EdgeInsets.all(
          6,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.Primary:
        return ColorConstant.red400;
      case IconButtonVariant.OutlineBlack90019:
        return ColorConstant.blueGray900;
      case IconButtonVariant.OutlineRed70028:
        return ColorConstant.red400;
      case IconButtonVariant.OutlineGray90063:
        return ColorConstant.blueGray900;
      default:
        return ColorConstant.blueGray900;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder26:
        return BorderRadius.circular(
          26.00,
        );
      case IconButtonShape.RoundedBorder4:
        return BorderRadius.circular(
          4.00,
        );
      default:
        return BorderRadius.circular(
          18.00,
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack90019:
        return [
          BoxShadow(
            color: ColorConstant.black90019,
            spreadRadius: 2.00,
            blurRadius: 2.00,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.OutlineRed70028:
        return [
          BoxShadow(
            color: ColorConstant.red70028,
            spreadRadius: 2.00,
            blurRadius: 2.00,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.OutlineGray90063:
        return [
          BoxShadow(
            color: ColorConstant.gray90063,
            spreadRadius: 2.00,
            blurRadius: 2.00,
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case IconButtonVariant.Primary:
        return null;
      default:
        return [
          BoxShadow(
            color: ColorConstant.black90042,
            spreadRadius: 2.00,
            blurRadius: 2.00,
            offset: Offset(
              0,
              1,
            ),
          )
        ];
    }
  }
}

enum IconButtonShape {
  CircleBorder18,
  CircleBorder26,
  RoundedBorder4,
}
enum IconButtonPadding {
  PaddingAll6,
  PaddingAll14,
  PaddingAll2,
  PaddingAll10,
}
enum IconButtonVariant {
  Dark,
  Primary,
  OutlineBlack90019,
  OutlineRed70028,
  OutlineGray90063,
}
