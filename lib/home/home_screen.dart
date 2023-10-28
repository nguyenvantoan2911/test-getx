import 'package:app_lo/home/Controller/getx_controller.dart';
import 'package:app_lo/home/detailed_screen/detailed.dart';
import 'package:app_lo/widget/buttom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final controller = Get.put(getxController());
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "app_bar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).tr(),
          actions: const [
            Button(),
          ],
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
                      hintText: 'screach_home',
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
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.listStudent.length,
                      itemBuilder: (context, index) {
                        final item = controller.listStudent[index];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {},
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
                      }))
            ],
          ),
        ));
  }
}
