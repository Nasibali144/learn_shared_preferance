import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_shared_preferance/models/post_model.dart';
import 'package:learn_shared_preferance/services/new_pref_service.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NewPrefService.init();

  Hive.registerAdapter(PostAdapter());
  await Hive.initFlutter();
  // await Hive.openBox('testBox');
  await Hive.openBox<Post>('postBox');

  runApp(const LearnDb());
}

