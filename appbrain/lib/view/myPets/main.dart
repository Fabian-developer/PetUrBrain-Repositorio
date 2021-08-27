import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../bloc/Home.dart';
import '../../utility/Pointer.dart';

part 'ListCard.dart';

class MyPets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlocHome>(builder: (context, bloc) {
      return Scaffold(
        appBar: AppBar(
          title: Text('myPets02'.tr()),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: .75,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            blocHome.cUser.animals.length,
            (index) => ListCard(bloc, index),
          ),
        ),
      );
    });
  }
}
