import 'package:flutter/material.dart';
import 'package:learn_shared_preferance/services/db_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  String data = "No Data";
  late DataService dataService;
  TextEditingController controller = TextEditingController();

  @override
  initState() {
    super.initState();
    _init();
  }

  void _init() async {
    dataService = await DataService().instance();
    _readData();
  }

  void _readData() async {
    setState(() {
      isLoading = true;
    });
    String? newData = await dataService.getData("data");
    setState((){
      data = newData ?? data;
      isLoading = false;
    });
  }

  void _storeData() async {
    setState(() {
      isLoading = true;
    });

    String data = controller.text.trim();
    await dataService.setData("data", data);

    setState(() {
      isLoading = false;
    });
    _readData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text("Learn Data Service"),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data),
                const SizedBox(height: 20,),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: "Enter Data"),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: _storeData,
                  child: const Text("Send"),
                ),
              ],
            ),
          ),

          Visibility(
            visible: isLoading,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
