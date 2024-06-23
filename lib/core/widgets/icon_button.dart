import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saidoffapp/core/style/app_colors.dart';


class WElevatedIconButton extends StatelessWidget {
  final String text;
  final String icon;
  final void Function()? onPressed;
  const WElevatedIconButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 163,
      child: ElevatedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.fillcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          height: 24,
        ),
        label: Text(text)
      ),
    );
  }
}