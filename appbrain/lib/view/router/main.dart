import 'dart:convert';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:peturbrain/function/Cache.dart';
import 'package:peturbrain/model/User.dart';
import 'package:peturbrain/utility/Pointer.dart';
import 'package:flutter/material.dart';

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  static Future<void> initConfig() async {
    try {
      final RemoteConfig remoteConfig = RemoteConfig.instance;

      Map<String, dynamic> _cache;
      bool _update = true;

      try {
        await remoteConfig.fetchAndActivate();

        _cache = remoteConfig.getAll().map<String, dynamic>(
            (String key, RemoteConfigValue value) =>
                MapEntry<String, dynamic>(key, jsonDecode(value.asString())));
      } catch (e) {
        _update = false;
        _cache = await FunctionCache.getConfig();
      }

      config = _cache;

      if (Platform.isIOS) await FunctionCache.saveConfig(_cache, _update);
    } catch (e) {
      return e;
    }
  }

  void init() async {
    String _value = await FunctionCache.getRedirect(), navigator = '';
    await initConfig();

    if (_value == null) {
      navigator = '/intro';
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
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      ),
    );
  }
}
