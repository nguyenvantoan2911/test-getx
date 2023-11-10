import 'dart:convert';

import 'package:app_lo/home/Controller/student.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getxController extends GetxController {
  List<dynamic> timkiem = <Student>[].obs;
  List<Student> listStudent = <Student>[].obs;
  List<dynamic> deletionList = <Student>[].obs;
  String searchText = '';
  Dio dio = Dio();
  @override
  void onInit() async {
    super.onInit();
    List<Student> data = await getFromSharedPreferences();
    if (data.isNotEmpty) {
      listStudent.addAll(data);
    } else {
      fetchData();
    }
  }

// tìm kiếm trong danh sách
  void search(String value) {
    searchText = value;
    if (searchText.isEmpty) {
      timkiem.assignAll(listStudent);
      update();
    } else {
      List<Student> filteredStudents = listStudent.where((student) {
        return student.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
      timkiem.assignAll(filteredStudents);
      update();
    }
  }

// call api lấy data về
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
      }
    } catch (e) {
      print(e);
    }
  }

//lưu vào SharedPreferences
  Future<void> saveToSharedPreferences(List<Student> students) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentJson =
        students.map((student) => json.encode(student.toJson())).toList();
    await prefs.setStringList('students', studentJson);
  }

//lấy ra từ SharedPreferences
  Future<List<Student>> getFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<Student> studentsSr = [];
    if (prefs.containsKey('students')) {
      final studentsJson = prefs.getStringList('students');
      if (studentsJson != null) {
        studentsSr = studentsJson
            .map((studentJ) => Student.fromJson(json.decode(studentJ)))
            .toList();
        print(studentsSr);
        return studentsSr;
      }
      return studentsSr;
    } else {
      return studentsSr;
    }
  }

// xoá data
  void deleteComment(int commentId) async {
    try {
      final response = await dio
          .delete('https://jsonplaceholder.typicode.com/comments/$commentId');
      if (response.statusCode == 200) {
        final Student commentToDelete =
            listStudent.firstWhere((comment) => comment.id == commentId);
        if (commentToDelete != null) {
          listStudent.remove(commentToDelete);
          if (searchText.isNotEmpty) {
            timkiem.remove(commentToDelete);
          }
          deletionList.add(commentToDelete);
        } else {
          print('Không có gia trị id $commentId');
        }
      } else {
        throw Exception('Failed to delete comment with ID $commentId');
      }
    } catch (e) {
      rethrow;
    }
  }

  //khôi phục lại cái đã xoá
  void restoreComment(int commentId) {
    final deletedComment =
        deletionList.firstWhere((comment) => comment.id == commentId);
    if (deletedComment != null) {
      listStudent.add(deletedComment);
      if (searchText.isNotEmpty) {
        timkiem.add(deletedComment);
      }
      deletionList.remove(deletedComment);
      update();
    }
  }

//thêm vào danh sách từ api
  Future<void> addComment(Student newComment) async {
    try {
      final response = await dio.post(
          'https://jsonplaceholder.typicode.com/comments',
          data: newComment.toJson());
      if (response.statusCode == 201) {
        final addedComment = Student.fromJson(response.data);
        listStudent.add(addedComment);
        saveToSharedPreferences(listStudent);
      } else {
        throw Exception('Failed to add comment');
      }
    } catch (e) {
      print(e);
    }
  }
}
