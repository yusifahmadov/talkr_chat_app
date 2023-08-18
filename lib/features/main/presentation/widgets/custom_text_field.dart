import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:talkr_chat_app/features/main/presentation/utility/custom_border_radius.dart';
import 'package:talkr_chat_app/features/main/presentation/utility/text_field_obscure_checker.dart';

import 'package:talkr_chat_app/features/main/presentation/widgets/custom_obscure_checker.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.obscured = false, this.controller});
  final String? hintText;
  final bool? obscured;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldObscureChecker>(
      builder: (BuildContext context, obscureChecker, Widget? child) {
        return TextFormField(
          cursorHeight: 14,
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium,
          obscureText: obscured == true ? obscureChecker.isObscured : false,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: CustomBorderRadius.radius8()),
              suffixIcon:
                  obscured == true ? const CustomObscureChecker() : null,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: CustomBorderRadius.radius8()),
              hintText: hintText,
              filled: true,
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: CustomBorderRadius.radius8())),
        );
      },
    );
  }
}
