import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/features/spash/controller/splash_ctr.dart';
import 'package:saidoffapp/setup.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashController);
    ref.read(splashController);
    Timer(const Duration(seconds: 1), () {
      context.goNamed(box.get('access') == null ? Routes.onboarding : Routes.home);
    });
    return Scaffold(
      body: Center(
        child: Text('Welcome',
            style: GoogleFonts.signika(
              textStyle: const TextStyle(
                color: Colors.indigoAccent,
                fontSize: 50,
              ),
            )),
      ),
    );
  }
}
