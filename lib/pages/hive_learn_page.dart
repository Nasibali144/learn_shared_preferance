import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveLearnPage extends StatefulWidget {
  const HiveLearnPage({Key? key}) : super(key: key);

  @override
  State<HiveLearnPage> createState() => _HiveLearnPageState();
}

class _HiveLearnPageState extends State<HiveLearnPage> {
  late String data;

  @override
  initState() {
    super.initState();
    getData();
  }

  void getData() {
    var box = Hive.box('testBox');
    data = box.get("data", defaultValue: "No Data");
    setState(() {});
  }

  void setData(String value) async {
    var box = Hive.box('testBox');
    await box.put("data", value);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Hive Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(data, style: const TextStyle(fontSize: 27.5),),
            const SizedBox(height: 20,),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter data",
              ),
              style: const TextStyle(fontSize: 27.5),
              onSubmitted: setData,
            ),
          ],
        ),
      ),
    );
  }
}
