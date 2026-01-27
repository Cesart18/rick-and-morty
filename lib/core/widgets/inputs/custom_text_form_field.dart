import 'package:flutter/services.dart';
import 'package:rick_and_morty/core/ui.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.focusNode,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      decoration: InputDecoration(
        border: inputBorder(context),
        enabledBorder: inputBorder(context),
        focusedBorder: inputBorder(
          context,
          color: ColorValues.borderPrimary(context),
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        suffixIcon: suffixIcon,
        hintStyle: context.appTextStyles.textSm.copyWith(
          color: ColorValues.textTertiary(context),
        ),
      ),
    );
  }

  OutlineInputBorder inputBorder(BuildContext context, {Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(WidthValues.radius2xl),
      borderSide: BorderSide(
        color: color ?? ColorValues.borderSecondary(context),
      ),
    );
  }
}
