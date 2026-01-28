import 'package:rick_and_morty/core/ui.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    required this.items,
    super.key,
    this.value,
    this.onChanged,
    this.hintText,
    this.itemLabelBuilder,
    this.showAllOption = false,
    this.allOptionLabel = 'All',
  });

  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? hintText;
  final String Function(T)? itemLabelBuilder;
  final bool showAllOption;
  final String allOptionLabel;

  @override
  Widget build(BuildContext context) {
    final allEntries = [
      if (showAllOption)
        DropdownMenuEntry<T?>(value: null, label: allOptionLabel),
      ...items.map((item) {
        final label = itemLabelBuilder?.call(item) ?? item.toString();
        return DropdownMenuEntry<T?>(value: item, label: label);
      }),
    ];

    return DropdownMenu<T?>(
      key: value == null ? UniqueKey() : ValueKey(value),
      initialSelection: value,
      expandedInsets: EdgeInsets.zero,
      hintText: hintText,
      onSelected: onChanged,
      textStyle: context.appTextStyles.textSm.copyWith(
        color: ColorValues.textPrimary(context),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorValues.bgPrimary(context)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WidthValues.radius2xl),
          ),
        ),
        elevation: const WidgetStatePropertyAll(4),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidthValues.radius2xl),
          borderSide: BorderSide(color: ColorValues.borderSecondary(context)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidthValues.radius2xl),
          borderSide: BorderSide(color: ColorValues.borderSecondary(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidthValues.radius2xl),
          borderSide: BorderSide(color: ColorValues.borderPrimary(context)),
        ),
        hintStyle: context.appTextStyles.textSm.copyWith(
          color: ColorValues.textTertiary(context),
        ),
      ),
      trailingIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: ColorValues.textTertiary(context),
      ),
      selectedTrailingIcon: Icon(
        Icons.keyboard_arrow_up_rounded,
        color: ColorValues.textTertiary(context),
      ),
      dropdownMenuEntries: allEntries,
    );
  }
}
