import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('home05')),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          translator.translate('tutorial01'),
        ),
      ),
    );
  }
}
