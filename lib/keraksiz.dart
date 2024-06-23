import 'package:flutter/material.dart';

class Keraksiz extends StatefulWidget {
  const Keraksiz({super.key});

  @override
  State<Keraksiz> createState() => _KeraksizState();
}

class _KeraksizState extends State<Keraksiz> {
  late TargetPlatform _platform;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _platform = Theme.of(context).platform;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_platform.toString());
    return const Placeholder();
  }
}
