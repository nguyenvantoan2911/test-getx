import 'package:app_lo/detailed.dart';
import 'package:app_lo/getx_controller.dart';
import 'package:app_lo/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _textEditingController = TextEditingController();

  final controller = Get.put(getxController());
  Future<List<Student>>? loadingData;

  @override
  void initState() {
    loadingData = controller.getFromSharedPreferences();
    controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('danh sách học sinh'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.all(12),
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    controller.search(value);
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 6, 7, 6), width: 2)),
                      hintText: 'What in your mind',
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {
                          _textEditingController.clear();
                          controller.search('');
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<List<Student>>(
                  future: loadingData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Expanded(child: GetBuilder<getxController>(
                        builder: (context) {
                          final items = controller.searchText.isEmpty
                              ? controller.listStudent
                              : controller.timkiem;
                          return ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(Detailed(
                                          name: item.name ?? 'Tên không rõ',
                                          email: item.email ?? 'Email không rõ',
                                          body:
                                              item.body ?? 'Nội dung không rõ',
                                        ));
                                      },
                                      child: ListTile(
                                        leading: Text(
                                          item.id.toString(),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          item.name ?? '',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        subtitle: Text(item.email ?? '',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.blueGrey[300],
                                    )
                                  ],
                                );
                              });
                        },
                      ));
                    }
                  })
            ],
          ),
        ));
  }
}
