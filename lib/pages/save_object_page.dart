import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_shared_preferance/models/post_model.dart';

class SaveObjectPage extends StatefulWidget {
  const SaveObjectPage({Key? key}) : super(key: key);

  @override
  State<SaveObjectPage> createState() => _SaveObjectPageState();
}

class _SaveObjectPageState extends State<SaveObjectPage> {
  late Post post;
  String title = "";
  String content = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    var box = Hive.box<Post>("postBox");
    post = box.get("post", defaultValue: Post("No title", "No content"))!;
  }

  void setData() async {
    var box = Hive.box<Post>("postBox");
    box.put("post", Post(title, content));
  }

  void next(String value) {
    title = value;
    FocusScope.of(context).nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Hive with class object"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [

            // #data
            Text(
              "Object",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),

            // #title
            TextField(
              decoration: InputDecoration(
                hintText: "Title",
              ),
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20,),

            // #content
            TextField(
              decoration: InputDecoration(
                hintText: "Content",
              ),
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
