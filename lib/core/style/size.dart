import 'package:flutter/widgets.dart';

extension Appsize on BuildContext {
  double get h002 => MediaQuery.of(this).size.height * 0.02;
  double get w05 => MediaQuery.of(this).size.width * 0.5;
  double get h05 => MediaQuery.of(this).size.height * 0.5;
}

class AppSizeBox {
  static const SizedBox w10 = SizedBox(width: 10);
  static const SizedBox h50 = SizedBox(height: 50);
  static const SizedBox h20 = SizedBox(height: 20);

  static SizedBox h02(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height * 0.2);

  static SizedBox hDynamic(BuildContext context, double factor) =>
      SizedBox(height: MediaQuery.of(context).size.height * factor);

  static SizedBox wDynamic(BuildContext context, double factor) =>
      SizedBox(width: MediaQuery.of(context).size.width * factor);
}
