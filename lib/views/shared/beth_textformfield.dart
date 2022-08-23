import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BethTextFormField extends StatelessWidget {
  const BethTextFormField({
    Key? key,
    String? initialValue,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool isObscure = false,
    bool autocorrect = false,
    void Function(String?)? onSaved,

    // * InputDecoration
    String? hintText,
    Widget? label,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<TextInputFormatter>? inputFormatters,
  })  : _initialValue = initialValue,
        _validator = validator,
        _keyboardType = keyboardType,
        _isObscure = isObscure,

        // * InputDecoration
        _hintText = hintText,
        _label = label,
        _labelText = labelText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _inputFormatters = inputFormatters,
        _autocorrect = autocorrect,
        _onSaved = onSaved,
        super(key: key);

  final String? _initialValue;
  final TextInputType? _keyboardType;
  final bool _isObscure;
  final String? Function(String?)? _validator;
  final bool _autocorrect;

  // * InputDecoration
  final String? _hintText;
  final Widget? _label;
  final String? _labelText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final List<TextInputFormatter>? _inputFormatters;
  final void Function(String?)? _onSaved;

  /// centralized border radius
  final double _radius = 50;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        autocorrect: _autocorrect,
        inputFormatters: _inputFormatters,
        initialValue: _initialValue,
        cursorColor: BethColors.accent2,
        cursorWidth: 3,
        keyboardType: _keyboardType,
        obscureText: _isObscure,
        validator: _validator,
        onChanged: _onSaved,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: BethColors.grey),
          label: _label,
          alignLabelWithHint: false,
          labelText: _labelText,
          prefixIcon: _prefixIcon,
          suffixIcon: _suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide(color: BethColors().neutral1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide(color: BethColors.accent2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide(color: BethColors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide(color: BethColors.red),
          ),
        ),
      ),
    );
  }
}
