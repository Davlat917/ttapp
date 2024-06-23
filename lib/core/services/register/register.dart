// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saidoffapp/core/services/app_urls/urls.dart';
import 'package:saidoffapp/core/services/auth/login_ser.dart';
import 'package:saidoffapp/core/services/base_options/base_options.dart';
import 'package:saidoffapp/core/widgets/snacbar.dart';

class AuthRegisterService {
  static Dio dio = Dio(Baseoption.baseOptions);

  static Future<void> createuser(Map<String, dynamic> data, BuildContext context) async {
    var response = await dio.post('http://192.168.1.91:8000/api/register/',
        data:data);

    try {
      debugPrint("Username: ${'salom'}");
      debugPrint("Username: ${response.statusCode}");
      debugPrint("Username: ${Urls.baseUrl}${Urls.apiCreateUser}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthLoginService.getToken(data, context);
      } else {}
    } catch (e) {
      SnackBarHelper.showInternetConnectionError(
        context,
        'Kirish uchun ruxsat yo\'q',
      );
      debugPrint('Exception during login: $e');
    }
  }
}
