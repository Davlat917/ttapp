import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saidoffapp/core/config/lang_setting/inherted_locale.dart';
import 'package:saidoffapp/core/languages/app_local.dart';
import 'package:saidoffapp/core/router/app_routes.dart';
import 'package:saidoffapp/core/theme/darkk_theme.dart';
import 'package:saidoffapp/core/theme/lightt_theme.dart';

MaterialApp materialApp(BuildContext context) {
  return MaterialApp.router(
    locale: InheritedLocalNotifier.maybeOf(context)?.appLocale ??
        const Locale('ru', 'Ru'),
    supportedLocales: const [
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
    ],
    localizationsDelegates: const [
      AppLocalization.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    
    theme: lightTheme,
    darkTheme: darkTheme,
    debugShowCheckedModeBanner: false,
    routerConfig: Routing.router,
  );
}
