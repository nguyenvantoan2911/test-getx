import 'package:app_lo/detailed.dart';
import 'package:app_lo/getx_controller.dart';
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
  @override
  void initState() {
    controller.getFromSharedPreferences();
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
                  onChanged: (value) {},
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
                        onPressed: () {},
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
              Expanded(child: GetBuilder<getxController>(
                builder: (context) {
                  return ListView.builder(
                      itemCount: controller.listStudent.length,
                      itemBuilder: (context, index) {
                        final item = controller.listStudent[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(Detailed(
                                  name: item.name ?? 'Tên không rõ',
                                  email: item.email ?? 'Email không rõ',
                                  body: item.body ?? 'Nội dung không rõ',
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
              )),
            ],
          ),
        ));
  }
}
