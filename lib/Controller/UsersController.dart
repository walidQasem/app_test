import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Model/UserModel.dart';

class UserController extends GetxController {
  List<User> users = [];
  List<User> filteredUsers = [];
  bool isFiltered = false;
  bool isLoading = false;
  Icon icon = const Icon(Icons.filter_alt_outlined);

  filterUsersByInterest(String interest) {
    filteredUsers =
        users.where((user) => user.interests!.contains(interest)).toList();
    update();
  }

  onfilter() {
    isFiltered = !isFiltered;
    for (var user in users) {
      for (int indexUser = 0; indexUser < user.interests!.length; indexUser++) {
        filterUsersByInterest(user.interests![indexUser]);
      }
    }
    if (isFiltered) {
      icon = const Icon(Icons.highlight_remove_sharp);
    }
    icon = const Icon(Icons.filter_alt_outlined);
    update();
  }

  void fetchUsers() async {
    isLoading = true;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    users = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User.fromJson(data);
    }).toList();

    isLoading = false;

    update();
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
