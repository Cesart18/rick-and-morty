import 'package:flutter/services.dart';
import 'package:rick_and_morty/core/ui.dart';

/// Enum for different input types that determine keyboard and behavior.
enum InputType {
  /// Standard text input
  text,

  /// Email input with email keyboard
  email,

  /// Password input with obscured text
  password,

  /// Phone number input with phone keyboard
  phone,

  /// Numeric input with number keyboard
  number,

  /// Decimal number input
  decimal,

  /// Multi-line text input
  multiline,

  /// Search input with search action
  search,

  /// URL input with URL keyboard
  url,
}

/// {@template custom_text_form_field}
/// A customizable text form field with consistent styling and behavior.
///
/// Automatically configures keyboard type, text input action, and
/// input formatters based on the [inputType].
/// {@endtemplate}
class CustomTextFormField extends StatefulWidget {
  /// {@macro custom_text_form_field}
  const CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.inputType = InputType.text,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.filled = true,
    this.showCounter = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.inputFormatters,
    this.autovalidateMode,
    this.initialValue,
    this.obscuringCharacter = '•',
  });

  /// Controller for the text field.
  final TextEditingController? controller;

  /// Focus node for the text field.
  final FocusNode? focusNode;

  /// The type of input which determines keyboard and behavior.
  final InputType inputType;

  /// Label text displayed above the field.
  final String? label;

  /// Hint text displayed when the field is empty.
  final String? hint;

  /// Helper text displayed below the field.
  final String? helperText;

  /// Error text displayed below the field (overrides helper).
  final String? errorText;

  /// Icon displayed at the start of the field.
  final IconData? prefixIcon;

  /// Icon displayed at the end of the field.
  final IconData? suffixIcon;

  /// Widget displayed at the start of the field.
  final Widget? prefix;

  /// Widget displayed at the end of the field.
  final Widget? suffix;

  /// Callback when the text changes.
  final ValueChanged<String>? onChanged;

  /// Callback when the user submits.
  final ValueChanged<String>? onSubmitted;

  /// Callback when the field is tapped.
  final VoidCallback? onTap;

  /// Validator function for form validation.
  final FormFieldValidator<String>? validator;

  /// Whether the field is enabled.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether to autofocus the field.
  final bool autofocus;

  /// Maximum number of lines for the field.
  final int? maxLines;

  /// Minimum number of lines for the field.
  final int? minLines;

  /// Maximum length of the input.
  final int? maxLength;

  /// The action button on the keyboard.
  final TextInputAction? textInputAction;

  /// Text capitalization behavior.
  final TextCapitalization textCapitalization;

  /// Padding inside the field.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether to fill the background.
  final bool filled;

  /// Whether to show the character counter.
  final bool showCounter;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Whether the field expands to fill available space.
  final bool expands;

  /// Text alignment.
  final TextAlign textAlign;

  /// Custom text style.
  final TextStyle? style;

  /// Input formatters for the field.
  final List<TextInputFormatter>? inputFormatters;

  /// Auto-validation mode.
  final AutovalidateMode? autovalidateMode;

  /// Initial value when not using a controller.
  final String? initialValue;

  /// Character used to obscure text for passwords.
  final String obscuringCharacter;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.inputType == InputType.password;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return TextFormField(
      onTapOutside: (event) => _focusNode.unfocus(),
      controller: widget.controller,
      focusNode: _focusNode,
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      keyboardType: _getKeyboardType(),
      textInputAction: widget.textInputAction ?? _getTextInputAction(),
      textCapitalization: _getTextCapitalization(),
      autocorrect: _shouldAutocorrect(),
      enableSuggestions: _shouldEnableSuggestions(),
      maxLines: widget.inputType == InputType.password ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      expands: widget.expands,
      textAlign: widget.textAlign,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      inputFormatters: widget.inputFormatters ?? _getInputFormatters(),
      style:
          widget.style ??
          context.textTheme.bodyLarge?.copyWith(
            color: widget.enabled
                ? ColorValues.primary
                : ColorValues.textDisabled(context),
          ),
      buildCounter: widget.showCounter
          ? null
          : (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) => null,
      decoration: _buildDecoration(context, hasError),
    );
  }

  InputDecoration _buildDecoration(BuildContext context, bool hasError) {
    final borderColor = hasError
        ? ColorValues.borderError(context)
        : _isFocused
        ? ColorValues.primary
        : ColorValues.secondary;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor,
        width: _isFocused || hasError ? 1.5 : 1,
      ),
    );

    return InputDecoration(
      // Label
      labelText: widget.label,
      labelStyle: context.textTheme.bodyLarge?.copyWith(
        color: ColorValues.textSecondary(context),
      ),
      floatingLabelStyle: context.textTheme.bodyMedium?.copyWith(
        color: hasError
            ? ColorValues.fgErrorPrimary(context)
            : _isFocused
            ? ColorValues.primary
            : ColorValues.textSecondary(context),
        fontWeight: FontWeight.w500,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,

      // Hint
      hintText: widget.hint,
      hintStyle: context.textTheme.bodyLarge?.copyWith(
        color: ColorValues.textDisabled(context),
      ),

      // Helper & Error
      helperText: widget.helperText,
      helperStyle: context.textTheme.bodySmall?.copyWith(
        color: ColorValues.textTertiary(context),
      ),
      errorText: widget.errorText,
      errorStyle: context.textTheme.bodySmall?.copyWith(
        color: ColorValues.fgErrorPrimary(context),
      ),

      // Fill
      filled: widget.filled,
      fillColor: widget.enabled
          ? ColorValues.tertiary
          : ColorValues.bgDisabled(context),

      // Padding
      contentPadding:
          widget.contentPadding ??
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

      // Borders
      border: border,
      enabledBorder: border.copyWith(
        borderSide: const BorderSide(color: ColorValues.secondary),
      ),
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: ColorValues.primary, width: 1.5),
      ),
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: ColorValues.borderError(context)),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: BorderSide(
          color: ColorValues.borderError(context),
          width: 1.5,
        ),
      ),
      disabledBorder: border.copyWith(
        borderSide: BorderSide(color: ColorValues.borderDisabled(context)),
      ),

      // Icons
      prefixIcon: _buildPrefixIcon(context, hasError),
      prefix: widget.prefix,
      suffixIcon: _buildSuffixIcon(context, hasError),
      suffix: widget.suffix,
    );
  }

  Widget? _buildPrefixIcon(BuildContext context, bool hasError) {
    if (widget.prefixIcon == null) return null;

    return Icon(
      widget.prefixIcon,
      size: 20,
      color: hasError
          ? ColorValues.fgErrorPrimary(context)
          : _isFocused
          ? ColorValues.primary
          : ColorValues.fgSecondary(context),
    );
  }

  Widget? _buildSuffixIcon(BuildContext context, bool hasError) {
    // Password toggle takes priority
    if (widget.inputType == InputType.password) {
      return IconButton(
        onPressed: _toggleObscure,
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 20,
          color: hasError
              ? ColorValues.fgErrorPrimary(context)
              : ColorValues.fgSecondary(context),
        ),
      );
    }

    if (widget.suffixIcon == null) return null;

    return Icon(
      widget.suffixIcon,
      size: 20,
      color: hasError
          ? ColorValues.fgErrorPrimary(context)
          : _isFocused
          ? ColorValues.primary
          : ColorValues.fgSecondary(context),
    );
  }

  /// Returns the appropriate keyboard type based on [inputType].
  TextInputType _getKeyboardType() {
    return switch (widget.inputType) {
      InputType.text => TextInputType.text,
      InputType.email => TextInputType.emailAddress,
      InputType.password => TextInputType.visiblePassword,
      InputType.phone => TextInputType.phone,
      InputType.number => TextInputType.number,
      InputType.decimal => const TextInputType.numberWithOptions(decimal: true),
      InputType.multiline => TextInputType.multiline,
      InputType.search => TextInputType.text,
      InputType.url => TextInputType.url,
    };
  }

  /// Returns the appropriate text input action based on [inputType].
  TextInputAction _getTextInputAction() {
    return switch (widget.inputType) {
      InputType.multiline => TextInputAction.newline,
      InputType.search => TextInputAction.search,
      _ => TextInputAction.next,
    };
  }

  /// Returns the appropriate text capitalization based on [inputType].
  TextCapitalization _getTextCapitalization() {
    if (widget.textCapitalization != TextCapitalization.none) {
      return widget.textCapitalization;
    }

    return switch (widget.inputType) {
      InputType.text || InputType.multiline => TextCapitalization.sentences,
      _ => TextCapitalization.none,
    };
  }

  /// Returns whether autocorrect should be enabled.
  bool _shouldAutocorrect() {
    if (!widget.autocorrect) return false;

    return switch (widget.inputType) {
      InputType.email ||
      InputType.password ||
      InputType.phone ||
      InputType.number ||
      InputType.decimal ||
      InputType.url => false,
      _ => true,
    };
  }

  /// Returns whether suggestions should be enabled.
  bool _shouldEnableSuggestions() {
    if (!widget.enableSuggestions) return false;

    return switch (widget.inputType) {
      InputType.email ||
      InputType.password ||
      InputType.phone ||
      InputType.number ||
      InputType.decimal ||
      InputType.url => false,
      _ => true,
    };
  }

  /// Returns input formatters based on [inputType].
  List<TextInputFormatter>? _getInputFormatters() {
    return switch (widget.inputType) {
      InputType.phone => [FilteringTextInputFormatter.digitsOnly],
      InputType.number => [FilteringTextInputFormatter.digitsOnly],
      InputType.decimal => [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      _ => null,
    };
  }
}
