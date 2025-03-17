import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:librery_app/core/theme/app_colors.dart';
import 'package:librery_app/core/theme/font_variations.dart';

class InputField extends StatelessWidget {
  final TextInputType? textInputType;
  final bool capitalizedWords;
  final TextEditingController controller;
  final List<TextInputFormatter>? textInputFormatter;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLength;
  final bool autoValidate;
  final bool enable;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;
  final Widget? icon;
  final Widget? prefix;
  final Widget? suffix;
  final bool keepFocusWhenTapOutside;
  final GlobalKey<FormFieldState>? textFieldKey;
  final String? footerText;
  final bool hideErrorMsg;

  const InputField({
    super.key,
    this.textInputType,
    required this.controller,
    this.textInputFormatter,
    this.validator,
    this.capitalizedWords = false,
    this.maxLength,
    this.hintText,
    this.onChanged,
    this.enable = true,
    this.readOnly = false,
    this.autoValidate = false,
    this.autofillHints,
    this.onTap,
    this.focusNode,
    this.icon,
    this.prefix,
    this.suffix,
    this.onEditingComplete,
    this.keepFocusWhenTapOutside = false,
    this.textFieldKey,
    this.footerText,
    this.hideErrorMsg = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: textFieldKey,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      keyboardType: textInputType,
      enabled: enable,
      readOnly: readOnly,
      autocorrect: false,
      autofillHints: autofillHints,
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onTap: onTap,
      onTapOutside: (event) =>
          keepFocusWhenTapOutside ? null : FocusScope.of(context).unfocus(),
      decoration:
          _inputDecoration(icon: icon, prefixIcon: prefix, suffix: suffix),
      enableSuggestions: false,
      inputFormatters: textInputFormatter,
      maxLength: maxLength,
      onChanged: onChanged,
      spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
      style: _textStyle(),
      textCapitalization:
          capitalizedWords ? TextCapitalization.words : TextCapitalization.none,
      validator: validator,
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.smokyBlueGray,
        fontSize: 17,
        fontVariations: FontVariations.medium);
  }

  InputDecoration _inputDecoration(
      {Widget? icon, Widget? prefixIcon, Widget? suffix}) {
    return InputDecoration(
      icon: icon,
      prefix: prefixIcon,
      suffix: suffix ??
          const SizedBox(
            height: 20,
            width: 1,
          ),
      filled: true,
      fillColor: AppColors.darkNavigationBar,
      hintText: hintText,
      counterText: '',
      hintStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.smokyBlueGray,
        fontSize: 17,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkNavigationBar,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkNavigationBar,
        ),
      ),
      errorStyle: TextStyle(
        color: HexColor('#F74065'),
        fontSize: hideErrorMsg ? 0 : 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
