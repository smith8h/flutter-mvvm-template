import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/core/constants/colors.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool showSuffix;

  const TextInput({required this.controller, required this.hintText, super.key, this.onChanged, this.showSuffix = false});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool pwdVisibility = true;

  @override
  void initState() {
    super.initState();
    if (widget.showSuffix) pwdVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !pwdVisibility,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.hint, width: 1),
          borderRadius: BorderRadius.circular(24.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        suffixIcon:
            widget.showSuffix
                ? GestureDetector(
                  onTap: () => setState(() => pwdVisibility = !pwdVisibility),
                  child: Icon(pwdVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppColors.hint, size: 18.w),
                )
                : null,
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
