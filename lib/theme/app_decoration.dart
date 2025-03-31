import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineBlueA700 => BoxDecoration(
        color: ColorConstant.gray50,
        border: Border.all(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            2,
          ),
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get txtOutlineBluegray100 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blueGray100,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blueGray100,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );
  static BoxDecoration get txtOutlineBlueA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get gradientWhiteA700WhiteA70000 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.58,
            0.57,
          ),
          end: Alignment(
            0.58,
            -0.17,
          ),
          colors: [
            ColorConstant.whiteA700,
            ColorConstant.whiteA70000,
          ],
        ),
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder23 = BorderRadius.circular(
    getHorizontalSize(
      23,
    ),
  );

  static BorderRadius roundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6,
    ),
  );

  static BorderRadius circleBorder75 = BorderRadius.circular(
    getHorizontalSize(
      75,
    ),
  );

  static BorderRadius txtRoundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
