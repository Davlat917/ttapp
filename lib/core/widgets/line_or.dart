// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WLine extends StatelessWidget {
  const WLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Divider(
            indent: 19,
            endIndent: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        const Align(
          child: Text(
            'Or',
            
          ),
        ),
        Align(
          child: Divider(
            endIndent: 19,
            indent: (MediaQuery.of(context).size.width * 0.5),
          ),
        ),
      ],
    );
  }
}