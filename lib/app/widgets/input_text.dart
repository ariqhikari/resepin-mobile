part of 'widgets.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? icon;
  final String? Function(String?)? onChanged;
  final TextStyle? style;
  final bool isEnabled;
  final bool isNumber;

  const InputText({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.icon,
    this.style,
    this.isEnabled = true,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onChanged,
      style: mediumInterFontStyle.copyWith(color: whiteColor),
      keyboardType: isNumber != false ? TextInputType.number : null,
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
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(icon!),
              )
            : null,
      ),
    );
  }
}
