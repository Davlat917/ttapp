import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerController = ChangeNotifierProvider.autoDispose((ref) => RegisterController());

class RegisterController extends ChangeNotifier {
  final usernamee = TextEditingController();
  final email = TextEditingController();
  final passwordd = TextEditingController();
}
