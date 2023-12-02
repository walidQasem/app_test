// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Model/UserModel.dart';

class UserController extends GetxController {
    //*************************Variables*************************//

  List<User> list = [];
  List<User> users = [];
  List<User> filteredUsers = [];
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;
  bool isFiltered = false;
  bool isLoading = false;
  List<User> searchList = [];
  Icon icon = const Icon(Icons.filter_alt_outlined, color: Colors.white);
  //*************************Get Users Data*************************//

  Future<void> fetchUsers() async {
    try {
      isLoading = true;
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      users = querySnapshot.docs.map((doc) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      list = List.from(users);
    } catch (e) {
      // ignore: avoid_print
      print("Error");
    } finally {
      isLoading = false;
      update();
    }
  }
  //*************************add Users to list filtred*************************//

  void filterUsersByInterest(String interest) {
    filteredUsers =
        users.where((user) => user.interests!.contains(interest)).toList();
    update();
  }
  //*************************function to filter users by interest*************************//

  void onFilter() {
    isFiltered = !isFiltered;
    for (var user in users) {
      for (int indexUser = 0; indexUser < user.interests!.length; indexUser++) {
        filterUsersByInterest(user.interests![indexUser]);
      }
    }

    if (isFiltered) {
      list = List.from(filteredUsers);
      icon = const Icon(Icons.highlight_remove_sharp, color: Colors.white);
    } else {
      list = List.from(users);
      icon = const Icon(Icons.filter_alt_outlined, color: Colors.white);
    }
    update();
  }
  //*************************function to search user by name*************************//

  void searchUser(String value) {
    list = users
        .where((user) => user.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
  }

  @override
  void onInit() async {
    await fetchUsers();

    super.onInit();
  }
}
