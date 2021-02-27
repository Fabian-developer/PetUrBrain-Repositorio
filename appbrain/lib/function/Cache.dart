import 'dart:convert';
import 'dart:io';

import 'package:appbrain/model/User.dart';
import 'package:one_context/one_context.dart';
import 'package:path_provider/path_provider.dart';

class FunctionCache {
  static Future<File> getFile(String file) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return File(directory.path + file);
  }

  static Future<String> getRedirect() async {
    final File file = await getFile('/data.json');
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      return null;
    }
  }

  static Future<String> getUser() async {
    final File file = await getFile('/user.json');
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      return null;
    }
  }

  static Future<void> redirectTo(String value) async {
    await saveRedirect(value);
    OneContext().pushNamedAndRemoveUntil(value, (_) => false);
  }

  static Future<File> saveRedirect(String value) async {
    final String data = json.encode(value);
    final File file = await getFile('/data.json');
    return file.writeAsString(data);
  }

  static Future<File> saveUser(ModelUser user) async {
    final File file = await getFile('/user.json');
    return file.writeAsString(jsonEncode(user));
  }
}
