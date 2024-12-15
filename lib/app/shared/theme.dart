part of 'shared.dart';

// [INFO]
// Constant for sizes to be used in the app with respecting 8 pixel rules
class SizeApp {
  // [INFO]
  // Sizes that related with width
  static const w2 = 2.0;
  static const w4 = 4.0;
  static const w8 = 8.0;
  static const w10 = 10.0;
  static const w12 = 12.0;
  static const w14 = 14.0;
  static const w16 = 16.0;
  static const w20 = 20.0;
  static const w24 = 24.0;
  static const w28 = 28.0;
  static const w32 = 32.0;
  static const w36 = 36.0;
  static const w40 = 40.0;
  static const w48 = 48.0;
  static const w52 = 52.0;
  static const w56 = 56.0;
  static const w64 = 64.0;
  static const w72 = 72.0;
  static const w80 = 80.0;
  static const w96 = 96.0;
  static const w120 = 120.0;

  // [INFO]
  // Sizes that related with height
  static const h4 = 4.0;
  static const h5 = 5.0;
  static const h8 = 8.0;
  static const h12 = 12.0;
  static const h14 = 14.0;
  static const h16 = 16.0;
  static const h20 = 20.0;
  static const h24 = 24.0;
  static const h28 = 28.0;
  static const h32 = 32.0;
  static const h36 = 36.0;
  static const h40 = 40.0;
  static const h48 = 48.0;
  static const h52 = 52.0;
  static const h56 = 56.0;
  static const h64 = 64.0;
  static const h72 = 72.0;
  static const h80 = 80.0;
  static const h96 = 96.0;
  static const h120 = 120.0;
}

class Gap {
  /// [INFO]
  /// Gaps that related with width
  static const w4 = SizedBox(width: SizeApp.w4);
  static const w8 = SizedBox(width: SizeApp.w8);
  static const w10 = SizedBox(width: SizeApp.w10);
  static const w12 = SizedBox(width: SizeApp.w12);
  static const w14 = SizedBox(width: SizeApp.w14);
  static const w16 = SizedBox(width: SizeApp.w16);
  static const w20 = SizedBox(width: SizeApp.w20);
  static const w24 = SizedBox(width: SizeApp.w24);
  static const w28 = SizedBox(width: SizeApp.w28);
  static const w32 = SizedBox(width: SizeApp.w32);
  static const w36 = SizedBox(width: SizeApp.w36);
  static const w40 = SizedBox(width: SizeApp.w40);
  static const w48 = SizedBox(width: SizeApp.w48);
  static const w52 = SizedBox(width: SizeApp.w52);
  static const w56 = SizedBox(width: SizeApp.w56);
  static const w64 = SizedBox(width: SizeApp.w64);
  static const w72 = SizedBox(width: SizeApp.w72);
  static const w80 = SizedBox(width: SizeApp.w80);
  static const w96 = SizedBox(width: SizeApp.w96);
  static const w120 = SizedBox(width: SizeApp.w120);

  /// [INFO]
  /// Gaps that related with height
  static const h4 = SizedBox(height: SizeApp.h4);
  static const h5 = SizedBox(height: SizeApp.h5);
  static const h8 = SizedBox(height: SizeApp.h8);
  static const h12 = SizedBox(height: SizeApp.h12);
  static const h14 = SizedBox(height: SizeApp.h14);
  static const h16 = SizedBox(height: SizeApp.h16);
  static const h20 = SizedBox(height: SizeApp.h20);
  static const h24 = SizedBox(height: SizeApp.h24);
  static const h28 = SizedBox(height: SizeApp.h28);
  static const h32 = SizedBox(height: SizeApp.h32);
  static const h36 = SizedBox(height: SizeApp.h36);
  static const h40 = SizedBox(height: SizeApp.h40);
  static const h48 = SizedBox(height: SizeApp.h48);
  static const h52 = SizedBox(height: SizeApp.h52);
  static const h56 = SizedBox(height: SizeApp.h56);
  static const h64 = SizedBox(height: SizeApp.h64);
  static const h72 = SizedBox(height: SizeApp.h72);
  static const h80 = SizedBox(height: SizeApp.h80);
  static const h96 = SizedBox(height: SizeApp.h96);
  static const h120 = SizedBox(height: SizeApp.h120);
}

// Padding
const double defaultPadding = 14;

// Margin
const double defaultMargin = 20;

// Duration
const Duration defaultDuration = Duration(milliseconds: 250);

// Colors
Color redColor = 'FF5C5C'.toColor();
Color lightYellowColor = 'FAC44D'.toColor();
Color yellowColor = 'F8B600'.toColor();
Color greenColor = 'A3DC2F'.toColor();
Color blackColor = '2B2B2B'.toColor();
Color grayColor = 'F2F2F2'.toColor();
Color darkGrayColor = '585858'.toColor();
Color whiteColor = 'FFFFFF'.toColor();
Color inputColor = whiteColor.withOpacity(.75);

// Inter Fonts
TextStyle regularInterFontStyle = GoogleFonts.inter(
  color: blackColor,
  fontSize: 14,
);

TextStyle mediumInterFontStyle = GoogleFonts.inter(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle semiBoldInterFontStyle = GoogleFonts.inter(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle boldInterFontStyle = GoogleFonts.inter(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

// Heading
TextStyle headingPrimaryFontStyle =
    semiBoldInterFontStyle.copyWith(fontSize: 32);

TextStyle headingSecondaryFontStyle =
    semiBoldInterFontStyle.copyWith(fontSize: 24);

// Box Shadow
BoxShadow defaultBoxShadow = BoxShadow(
  color: 'B1ADAD'.toColor().withOpacity(0.25),
  spreadRadius: 0,
  blurRadius: 10,
  offset: const Offset(0, 0),
);

// Buttons
ButtonStyle defaultButtonStyle = makeButton(yellowColor);

// Functions
ButtonStyle makeButton(
  Color primary, {
  double borderRadius = 12,
  Color textColor = Colors.white,
}) {
  return ElevatedButton.styleFrom(
    foregroundColor: textColor, // Sets the text color
    backgroundColor: primary, // Sets the button background color
    disabledForegroundColor: primary.withOpacity(0.38),
    disabledBackgroundColor: primary.withOpacity(0.12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    shadowColor: primary,
    textStyle: semiBoldInterFontStyle,
  );
}

// Inputs
InputDecoration chatInputStyle = makeInput(40, '4FABD8');
InputDecoration defaultInputStyle = makeInput(10, 'F8B600');

InputDecoration makeInput(double borderRadius, String color) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 22,
      vertical: 18,
    ),
    hintStyle: regularInterFontStyle.copyWith(color: yellowColor),
    labelStyle: regularInterFontStyle.copyWith(color: yellowColor),
    errorStyle: regularInterFontStyle.copyWith(color: redColor, fontSize: 12),
    focusColor: color.toColor(),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.transparent,
      ),
    ),
  );
}

// Loading Indicator
Widget makeLoadingIndicator({Color? color, double? size}) {
  return SpinKitRing(
    size: size ?? 20,
    color: color ?? whiteColor,
    lineWidth: 3,
  );
}

// Snackbar
void showSnackBar(String message, {String status = "Warning"}) {
  Get.snackbar(
    status,
    message,
    colorText: whiteColor,
    backgroundColor: status == "Warning" ? redColor : "7AC267".toColor(),
  );
}
