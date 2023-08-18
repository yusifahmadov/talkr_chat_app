import 'package:flutter/material.dart';
import 'package:talkr_chat_app/core/constant/constants.dart';
import 'package:talkr_chat_app/features/main/presentation/utility/custom_border_radius.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      this.isExpanded = true,
      required this.onPressed});
  final String text;
  final bool isExpanded;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      highlightColor: Colors.transparent,
      splashColor: blackBackgroundColor,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      color: appMainColor,
      shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.radius8()),
      minWidth: isExpanded ? double.infinity : 100,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
