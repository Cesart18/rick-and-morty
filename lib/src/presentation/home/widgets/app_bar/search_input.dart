part of '../../base/home_page.dart';

class _SearchInput extends StatelessWidget {
  const _SearchInput({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
    this.focusNode,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        return CustomTextFormField(
          controller: controller,
          hintText: hintText,
          focusNode: focusNode,
          suffixIcon: value.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 18,
                    color: ColorValues.textTertiary(context),
                  ),
                  onPressed: onClear,
                )
              : null,
          onChanged: onChanged,
        );
      },
    );
  }
}
