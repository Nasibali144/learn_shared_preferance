import 'package:flutter/material.dart';
import 'package:learn_shared_preferance/services/new_pref_service.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NewPrefService.init();

  runApp(const LearnDb());
}

