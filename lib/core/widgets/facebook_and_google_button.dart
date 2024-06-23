import 'package:flutter/material.dart';
import 'package:saidoffapp/core/services/auth/google_login_ser.dart';
import 'package:saidoffapp/core/style/size.dart';
import 'package:saidoffapp/core/widgets/icon_button.dart';

class ButtonFG extends StatelessWidget {
  const ButtonFG({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Expanded(
          child: WElevatedIconButton(text: 'Facebook', icon: 'assets/icons/facebook.svg'),
        ),
        AppSizeBox.w10,
        Expanded(
            child: WElevatedIconButton(
          text: 'Google',
          icon: 'assets/icons/google.svg',
          onPressed: () async {
          await  GoogleLoginService.googlLogin(context);
          },
        )),
      ],
    );
  }
}
