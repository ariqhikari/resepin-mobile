part of 'widgets.dart';

class InputSelect extends StatelessWidget {
  final String value;
  final List<String> list;
  final Function(String?) onChange;

  const InputSelect({
    super.key,
    required this.value,
    required this.list,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        // vertical: 10,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: yellowColor, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: value,
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: yellowColor),
            style: mediumInterFontStyle.copyWith(color: inputColor),
            isExpanded: true,
            dropdownColor: whiteColor,
            borderRadius: BorderRadius.circular(5),
            onChanged: (String? newValue) {
              onChange(newValue);
            },
            items: list.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()),
      ),
    );
  }
}
