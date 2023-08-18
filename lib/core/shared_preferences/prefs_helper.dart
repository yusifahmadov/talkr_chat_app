import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkr_chat_app/injection.dart';

class SharedPrefsHelper {
  static toJson(String key, dynamic value) async {
    getIt<SharedPreferences>().setString(key, json.decode(value));
  }

  static fromJson(String key) async {
    return json.encode(getIt<SharedPreferences>().getString(key));
  }
}
