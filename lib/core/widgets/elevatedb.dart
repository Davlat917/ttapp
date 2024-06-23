

import 'package:flutter/material.dart';

class WElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const WElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.indigoAccent,
        minimumSize: const Size(
          double.infinity,
          60,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
