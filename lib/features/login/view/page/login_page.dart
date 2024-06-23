import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/core/services/auth/login_ser.dart';
import 'package:saidoffapp/core/style/app_textstyle.dart';
import 'package:saidoffapp/core/style/size.dart';
import 'package:saidoffapp/core/widgets/elevatedb.dart';
import 'package:saidoffapp/core/widgets/facebook_and_google_button.dart';
import 'package:saidoffapp/core/widgets/line_or.dart';
import 'package:saidoffapp/core/widgets/wtext_fild.dart';
import 'package:saidoffapp/features/login/controller/login_/ctr.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginController);
    var ctr = ref.read(loginController);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: AppTextstyles.register32,
                ),
                Text(
                  'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                  style: AppTextstyles.register14,
                  textAlign: TextAlign.center,
                ),
                AppSizeBox.h20,
               // button facebook ,google
                const ButtonFG(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: WLine(),
                ),
                Column(
                  children: [
                    WTextFild(
                      controller: ctr.username,
                      hintext: 'Email  / Phone Number ',
                    ),
                    WTextFild(
                      controller: ctr.password,
                      hintext: 'Password',
                      counter: const Text('Forget Password?'),
                    ),
                  ],
                ),
                AppSizeBox.h20,
                WElevatedButton(
                  child: Text(
                    'Log In',
                    style: AppTextstyles.buttontext,
                  ),
                  onPressed: () async {
                    await AuthLoginService.getToken({
                      "username": ctr.username.text,
                      "password": ctr.password.text,
                    }, context);
                  },
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(text: 'Don’t have account?  ', style: AppTextstyles.register14),
                    TextSpan(
                        text: 'Sign Up ',
                        style: AppTextstyles.register14indigo,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.goNamed(Routes.register,)),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

