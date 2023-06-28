import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class CommonInputField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? textController;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final bool obscureText;
  final int maxLine;
  final bool isEnable;
  final TextInputType? keyboardType;

  const CommonInputField({
    Key? key,
    this.suffixIcon,
    this.prefixIcon,
    this.textController,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.maxLine = 1,
    this.maxLength,
    this.isEnable = true,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: textController,
      autofocus: false,
      enabled: isEnable,
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText,
          counterText: "",
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0.5, color: Colors.green)),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0.5, color: Colors.grey)),
      ),
    );
  }
}
