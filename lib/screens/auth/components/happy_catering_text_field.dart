import 'package:flutter/material.dart';

class HappyCateringTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMessage;
  final String? Function(String?)? onChanged;

  const HappyCateringTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMessage,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon:  prefixIcon != null
        ? IconTheme(
          data: IconThemeData (
            color:Theme.of(context).colorScheme.secondary),
            child: prefixIcon!,
        )
        : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        fillColor: Colors.transparent,
        filled: true,
        hintText: hintText,
				hintStyle: TextStyle(color: Colors.grey[500]),
        errorText: errorMessage,
      ),
    );
  }
}