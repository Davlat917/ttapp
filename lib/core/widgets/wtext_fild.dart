import 'package:flutter/material.dart';
import 'package:saidoffapp/core/style/app_colors.dart';
import 'package:saidoffapp/core/style/app_textstyle.dart';

class WTextFild extends StatelessWidget {
  final String hintext;
  final TextEditingController controller;
  final Widget? counter;
  const WTextFild({
    super.key,
    this.counter,
    required this.hintext,
    required this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        
        decoration: InputDecoration(
          counter:counter ,
          hintStyle: AppTextstyles.hinttext,
          fillColor: const Color.fromARGB(255, 235, 244, 255),
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: AppColors.c_2A4ECA,
            ),
          ),
          hintText: hintext,
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        
      ),
    );
  }
}
