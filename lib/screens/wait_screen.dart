import 'package:coffe_shop/components/loader_component.dart';
import 'package:flutter/material.dart';

class WaitScreen extends StatelessWidget {
  const WaitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderComponent(text: 'Por favor espere...'),
    );
  }
}
