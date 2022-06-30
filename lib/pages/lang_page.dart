import 'package:flutter/material.dart';
import 'package:learn_shared_preferance/services/new_pref_service.dart';

class LangPage extends StatefulWidget {
  const LangPage({Key? key}) : super(key: key);

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  String lang = "";
  
  @override
  initState() {
    super.initState();
    getLang();
  }
  
  void getLang() async {
    var res = NewPrefService.readData(StorageKey.lang) ?? "";
    lang = res as String;
    setState(() {});
  }
  
  void setLang(String result) async {
    await NewPrefService.setData(StorageKey.lang, result);
    getLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(lang, style: TextStyle(fontSize: 30),),
          SizedBox(height: 20,),
          TextField(
            decoration: const InputDecoration(
              hintText: "Enter Language",
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            onSubmitted: setLang,
          ),
        ],
      ),
    );
  }
}
