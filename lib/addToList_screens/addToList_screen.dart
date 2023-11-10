import 'package:app_lo/home/Controller/getx_controller.dart';
import 'package:app_lo/home/Controller/student.dart';
import 'package:app_lo/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToList extends StatefulWidget {
  const AddToList({super.key});

  @override
  State<AddToList> createState() => _AddToListState();
}

class _AddToListState extends State<AddToList> {
  final controller = Get.find<getxController>();

  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController bodyEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm dữ liệu vào danh sách'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Container(
            height: 60,
            margin: const EdgeInsets.only(right: 12, left: 12, top: 12),
            child: TextField(
              controller: nameEditingController,
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
                  hintText: 'Thông tin tên',
                  labelText: 'Nhập Tên',
                  prefixIcon: const Icon(Icons.person),
                  suffix: IconButton(
                    onPressed: () {
                      nameEditingController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.only(right: 12, left: 12, top: 12),
            child: TextField(
              controller: emailEditingController,
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
                  hintText: 'Thông tin Email',
                  labelText: 'Nhập email',
                  prefixIcon: const Icon(Icons.mail),
                  suffix: IconButton(
                    onPressed: () {
                      emailEditingController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.only(right: 12, left: 12, top: 12),
            child: TextField(
              controller: bodyEditingController,
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
                  hintText: 'Thông tin nội dung',
                  labelText: 'Nhập nội dung',
                  prefixIcon: const Icon(Icons.content_paste),
                  suffix: IconButton(
                    onPressed: () {
                      bodyEditingController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  addNewComment();
                  Get.to(const MyHome());
                },
                child: const Text(
                  'Hoàn Thành',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
          )
        ]),
      ),
    );
  }

  void addNewComment() {
    final newComment = Student(
      id: controller.listStudent.length++,
      name: nameEditingController.text,
      email: emailEditingController.text,
      body: bodyEditingController.text,
    );

    controller.addComment(newComment);
    nameEditingController.clear();
    emailEditingController.clear();
    bodyEditingController.clear();
  }
}
