import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talkr_chat_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'injection.dart' as di;

void main() async {
  await DotEnv().load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();
  runApp(const MaterialApp(
    home: App(),
  ));
}
