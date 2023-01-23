import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_workshop/presentation/styles/app_colors.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    Key? key,
    this.labelText = "",
    this.hintText = "",
    this.startValue,
    this.isPasswordField = false,
    this.isObscureText = false,
    this.maxLines = 1,
    required this.controller,
    required this.validation,
    required this.onChanged,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  String? startValue;
  bool isPasswordField;
  bool isObscureText;
  final int? maxLines;
  final TextEditingController controller;
  Function validation;
  Function onChanged;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscureText,
      maxLines: widget.maxLines,
      initialValue: widget.startValue,
      cursorColor: AppColors.primaryColor,
      validator: (value) => widget.validation(value),
      onChanged: (value) => widget.onChanged(value),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.5)),
        labelText:
            (widget.labelText.isNotEmpty) ? widget.labelText : widget.hintText,
        labelStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.5)),
        focusColor: AppColors.primaryColor,
        floatingLabelStyle: GoogleFonts.poppins(color: AppColors.primaryColor),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon((widget.isObscureText)
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: AppColors.primaryColor,
                onPressed: () {
                  setState(() {
                    widget.isObscureText = !widget.isObscureText;
                  });
                },
              )
            : const SizedBox(),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 3),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(
              15.sp,
            )),
      ),
    );
  }
}
