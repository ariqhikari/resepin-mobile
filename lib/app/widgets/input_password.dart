part of 'widgets.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final bool isEnabled;

  final RxBool isObscure = true.obs;

  InputPassword({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.style,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        obscureText: isObscure.value,
        controller: controller,
        style: regularInterFontStyle.copyWith(color: whiteColor),
        validator: validator,
        decoration: defaultInputStyle.copyWith(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: 12),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: whiteColor, width: 1),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: whiteColor, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: whiteColor, width: 1),
          ),
          labelText: hint,
          labelStyle: style ?? mediumInterFontStyle.copyWith(color: inputColor),
          enabled: isEnabled,
          fillColor: isEnabled ? null : whiteColor.withOpacity(.5),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 30, minWidth: 30),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset("assets/icons/ic_password.svg"),
          ),
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              isObscure.value
                  ? 'assets/icons/ic_eye.svg'
                  : 'assets/icons/ic_eye_hide.svg',
              color: whiteColor,
            ),
            onPressed: () {
              isObscure.value = !isObscure.value;
            },
          ),
        ),
      ),
    );
  }
}
