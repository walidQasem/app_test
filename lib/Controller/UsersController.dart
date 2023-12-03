// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_performance/firebase_performance.dart';
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
    final Trace trace = FirebasePerformance.instance.newTrace("UsersTrac");
    try {
      final stopwatch = Stopwatch()..start();
      isLoading = true;
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      final elapsedMilliseconds = stopwatch.elapsedMilliseconds;
      print('Time taken to bring in users: $elapsedMilliseconds ms');
      users.addAll(querySnapshot.docs.map((doc) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList());
      list = List.from(users);
    } catch (e) {
      // ignore: avoid_print
      print("Error $e");
    } finally {
      trace.stop();
      isLoading = false;
      update();
    }
  }

  //*************************add Users to list filtred*************************//

  void filterUsersByInterest(String interest) {
    filteredUsers =
        users.where((user) => user.interests!.contains(interest)).toList();
  }
  //*************************function to filter users by interest*************************//

  void onFilter() {
    isFiltered = !isFiltered;
    for (var user in users) {
      for (int indexUser = 0; indexUser < user.interests!.length; indexUser++) {
        filterUsersByInterest(user.interests![indexUser]);
      }
    }

    isFiltered ? list = List.from(filteredUsers) : list = List.from(users);
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
