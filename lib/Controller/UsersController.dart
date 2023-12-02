// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Model/UserModel.dart';

class UserController extends GetxController {
  //*************************Variables*************************//
  List<User> list = [];
  List<User> users = [];
  List<User> filteredUsers = [];
  bool isFiltered = false;
  bool isLoading = false;
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
      print("Error");
    } finally {
      isLoading = false;
      update();
    }
  }
  //*************************add Users to list filtred*************************//

  void addListFiltred(String interest) {
    filteredUsers =
        users.where((user) => user.interests!.contains(interest)).toList();
    update();
  }

  //*************************function to filter users by interest*************************//
  void filterUsersByInterest() {
    isFiltered = !isFiltered;
    for (var user in users) {
      for (int indexUser = 0; indexUser < user.interests!.length; indexUser++) {
        addListFiltred(user.interests![indexUser]);
      }
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
    super.onInit();
    await fetchUsers();
  }
}
