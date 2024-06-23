import 'package:flutter/material.dart';

class ConstPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imagePath;
  const ConstPage({
    super.key,
    this.title,
    this.subtitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          imagePath ?? 'assets/images/image1.png',
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title ?? 'Behavioral Health Service',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle ??
                'Transforming lives by offering hope and opportunities for recovery, wellness, and independence.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
