import 'dart:convert';
import 'dart:io';

import 'package:peturbrain/model/User.dart';
import 'package:one_context/one_context.dart';
import 'package:path_provider/path_provider.dart';

class FunctionCache {
  static Future<Map<String, dynamic>> getConfig() async {
    final File file = await getFile('/config.json');
    if (file.existsSync()) {
      final Map<String, dynamic> _json = jsonDecode(file.readAsStringSync())
          .cast<String, dynamic>() as Map<String, dynamic>;

      if (DateTime.now()
              .difference(DateTime.parse(_json['createdCache'] as String))
              .inHours >=
          24) {
        file.deleteSync();
        return null;
      } else {
        return _json;
      }
    } else {
      return null;
    }
  }

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

  static Future<void> saveConfig(Map<String, dynamic> data, bool update) async {
    if (update) {
      data['createdCache'] = DateTime.now().toString();
    }
    final File file = await getFile('/config.json');
    return file.writeAsString(jsonEncode(data));
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
