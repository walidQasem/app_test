import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Model/UsersModel.dart';

class UserController extends GetxController {
  List<User> users = [];
  List<User> filteredUsers = [];
  bool isFiltered = false;

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
    update();
  }

  void fetchUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    users = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User.fromJson(data);
    }).toList();
    update();
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
