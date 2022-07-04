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
    setState(() {});
  }

  void setData(String value) async {
    FocusScope.of(context).unfocus();

    content = value;
    setState(() {});

    var box = Hive.box<Post>("postBox");
    await box.put("post", Post(title, content));

    print("title: $title, content: $content");

    getData();
  }

  void next(String value) {
    title = value;
    setState(() {});

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
          children: [

            // #data
            Text(
              post.toString(),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const  SizedBox(height: 20,),

            // #title
            TextField(
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              onSubmitted: next,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20,),

            // #content
            TextField(
              decoration: const InputDecoration(
                hintText: "Content",
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              onSubmitted: setData,
            ),
          ],
        ),
      ),
    );
  }
}
