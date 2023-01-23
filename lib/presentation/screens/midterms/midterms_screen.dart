import 'package:flutter/material.dart';
import 'package:odc_workshop/presentation/widgets/default_text.dart';

class MidtermsScreen extends StatelessWidget {
  const MidtermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultText(text: 'Midterms'),
      ),
    );
  }
}
