import 'dart:convert';

import 'package:appbrain/function/Cache.dart';
import 'package:appbrain/model/User.dart';
import 'package:appbrain/utility/Pointer.dart';
import 'package:flutter/material.dart';

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  void init() async {
    String _value = await FunctionCache.getRedirect(), navigator = '';

    if (_value == null) {
      navigator = '/choose';
    } else {
      final String _data = json.decode(_value).toString();
      navigator = _data;
    }

    String _user = await FunctionCache.getUser();

    if (_user == null)
      cUser = ModelUser();
    else
      cUser = ModelUser.fromJson(json.decode(_user));

    Navigator.pushNamed(context, navigator);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
      ),
    );
  }
}
