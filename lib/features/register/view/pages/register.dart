import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/core/services/register/register.dart';
import 'package:saidoffapp/core/style/app_textstyle.dart';
import 'package:saidoffapp/core/style/size.dart';
import 'package:saidoffapp/core/widgets/elevatedb.dart';
import 'package:saidoffapp/core/widgets/facebook_and_google_button.dart';
import 'package:saidoffapp/core/widgets/line_or.dart';
import 'package:saidoffapp/core/widgets/wtext_fild.dart';
import 'package:saidoffapp/features/register/controller/register_ctr.dart';
import 'package:saidoffapp/setup.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerController);
    var ctr = ref.read(registerController);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
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
                padding: EdgeInsets.symmetric(vertical: 5),
                child: WLine(),
              ),
              Column(
                children: [
                  WTextFild(
                    controller: ctr.usernamee,
                    hintext: 'Name ',
                  ),
                  WTextFild(
                    controller: ctr.email,
                    hintext: 'Email  / Phone Number ',
                  ),
                  WTextFild(
                    controller: ctr.passwordd,
                    hintext: 'Password',
                    counter: const Text('Forget Password?'),
                  ),
                ],
              ),
              WElevatedButton(
                child: Text(
                  'Log In',
                  style: AppTextstyles.buttontext,
                ),
                onPressed: () async {
                  box.put('username', ctr.usernamee.text);
                  await AuthRegisterService.createuser({
                    "username": ctr.usernamee.text,
                    "password": ctr.passwordd.text,
                  }, context);
                },
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(text: 'Don’t have account?  ', style: AppTextstyles.register14),
                  TextSpan(
                      text: 'Sign In ',
                      style: AppTextstyles.register14indigo,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.goNamed(Routes.login)),
                ]),
              ),
            ],
          ),
        ));
  }
}
