import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginController = ChangeNotifierProvider.autoDispose((ref) => LoginController());

class LoginController extends ChangeNotifier {
  final username = TextEditingController();
  final password = TextEditingController();
}
