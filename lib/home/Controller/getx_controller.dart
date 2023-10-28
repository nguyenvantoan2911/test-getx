import 'dart:convert';

import 'package:app_lo/home/Controller/student.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getxController extends GetxController {
  List<dynamic> timkiem = [].obs;
  List<Student> listStudent = <Student>[].obs;
  String searchText = '';
  Dio dio = Dio();
  @override
  void onInit() async {
    super.onInit();
    // List<Student> data = await getFromSharedPreferences();
    // if (data.isNotEmpty) {
    //   listStudent.addAll(data);
    // } else {
    //   fetchData();
    // }
    fetchData();
  }

  void search(String value) {
    timkiem.clear();
    if (timkiem.isEmpty) {
      timkiem.addAll(listStudent);
    } else {
      List<Student> filteredStudents = listStudent.where((student) {
        return student.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
      timkiem.assignAll(filteredStudents);
    }
  }

  Future<void> fetchData() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/comments');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Student> newStudents =
            data.map((studentJson) => Student.fromJson(studentJson)).toList();
        listStudent.assignAll(newStudents);
        saveToSharedPreferences(listStudent);
        update(listStudent);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveToSharedPreferences(List<Student> students) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentJson =
        students.map((student) => json.encode(student.toJson())).toList();
    await prefs.setStringList('students', studentJson);
  }

  Future<List<Student>> getFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<Student> studentsSr = [];
    if (prefs.containsKey('students')) {
      final studentsJson = prefs.getStringList('students');
      if (studentsJson != null) {
        studentsSr = studentsJson
            .map((studentJ) => Student.fromJson(json.decode(studentJ)))
            .toList();
        return studentsSr;
      }
      return studentsSr;
    } else {
      return studentsSr;
    }
  }
}
