import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {this.fontStyle,
      this.alignment,
      this.onChange,
      this.isRightCheck = false,
      this.iconSize,
      this.value,
      this.groupValue,
      this.text,
      this.width,
      this.margin});

  RadioFontStyle? fontStyle;

  Alignment? alignment;

  Function(String)? onChange;

  bool? isRightCheck;

  double? iconSize;

  String? value;

  String? groupValue;

  String? text;

  double? width;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildRadioButtonWidget(),
          )
        : _buildRadioButtonWidget();
  }

  _buildRadioButtonWidget() {
    return InkWell(
      onTap: () {
        onChange!(value!);
      },
      child: Container(
        width: width,
        margin: margin ?? EdgeInsets.zero,
        child: isRightCheck! ? getRightSideRadio() : getLeftSideRadio(),
      ),
    );
  }

  Widget getRightSideRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 8,
          ),
          child: getTextWidget(),
        ),
        getRadioWidget(),
      ],
    );
  }

  Widget getLeftSideRadio() {
    return Row(
      children: [
        getRadioWidget(),
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: getTextWidget(),
        ),
      ],
    );
  }

  Widget getTextWidget() {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
      style: _setFontStyle(),
    );
  }

  Widget getRadioWidget() {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Radio<String>(
        value: value ?? "",
        groupValue: groupValue,
        activeColor: ColorConstant.whiteA700,
        onChanged: (value) {
          onChange!(value!);
        },
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.blueGray700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum RadioFontStyle {
  GilroyMedium16,
}
