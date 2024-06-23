// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saidoffapp/core/router/name_routes.dart';
import 'package:saidoffapp/core/services/app_urls/urls.dart';
import 'package:saidoffapp/core/services/base_options/base_options.dart';
import 'package:saidoffapp/core/widgets/snacbar.dart';
import 'package:saidoffapp/setup.dart';

class AuthLoginService {
  static Dio dio = Dio(Baseoption.baseOptions);

  static Future<void> getToken(Map<String, dynamic> data, BuildContext context) async {
    debugPrint(data['username']);
    try {
      var response = await dio.post(Urls.apiToken, data: {
        'username': 'user',
        'password': '1234'
      });
      debugPrint('\x1B[104m"${response.statusCode}"\x1B[0m');
      debugPrint('\x1B[104m"${response.data}"\x1B[0m');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = response.data as Map<String, dynamic>;
        String? accessToken = responseData["access"] as String?;
        String? refreshToken = responseData["refresh"] as String?;
        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          debugPrint("Refresh Token: $refreshToken");
          await box.put('access', accessToken);
          context.goNamed(Routes.home);
        } else {
          debugPrint('Login failed: Access token is null');
        }
      } else {
        debugPrint('Login failed: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      SnackBarHelper.showInternetConnectionError(
        context,
        'Kirish uchun ruxsat yo\'q',
      );
      debugPrint('Exception during login: $e');
    }
  }
}
