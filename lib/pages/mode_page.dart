import 'package:flutter/material.dart';
import 'package:learn_shared_preferance/services/pref_service.dart';

class ModePage extends StatefulWidget {
  const ModePage({Key? key}) : super(key: key);

  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  bool isDark = false;

  @override
  initState() {
    super.initState();
    getMode();
  }

  void getMode() async {
    isDark = await PrefService.getMode();
    setState(() {});
  }

  void setData(bool? value) async {
    await PrefService.setMode(value ?? false);
    getMode();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
        title: const Text("Mode Pref Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(value: isDark, onChanged: setData),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Mode: $isDark",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
