import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkr_chat_app/core/constant/constants.dart';
import 'package:talkr_chat_app/features/main/presentation/utility/text_field_obscure_checker.dart';

class CustomObscureChecker extends StatelessWidget {
  const CustomObscureChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldObscureChecker>(
      builder: (BuildContext context, value, Widget? child) {
        return IconButton(
          onPressed: () {
            value.setObscure = !value.isObscured;
          },
          icon: Icon(
            value.isObscured ? Icons.visibility_off : Icons.visibility,
            color: blackBackgroundAccentColor,
          ),
        );
      },
    );
  }
}
