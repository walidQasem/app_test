// ignore_for_file: file_names

import 'package:app_test/Controller/UsersController.dart';
import 'package:app_test/Widgets/UserPage/FilterWidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/UserPage/ListDataWidget.dart';
import '../Widgets/UserPage/NumberOfUserWidget.dart';
import '../Widgets/UserPage/SearchWidget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        appBar: AppBar(
          elevation: 0,
          title: const Text('users',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          backgroundColor: const Color.fromARGB(255, 38, 38, 38),
          centerTitle: true,
        ),
        //*************************Show bottom sheet For filtering Users*************************//
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 36, 36, 36),
            onPressed: () {
              Get.bottomSheet(const FilterWidget());
            },
            child: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
            )),
        body: GetBuilder<UserController>(builder: (controller) {
          //*************************is Loading*************************//
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //*************************When downloading data*************************//
          return const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*************************Seach User By Name*************************//
                SearchWidget(),
                SizedBox(
                  height: 10,
                ),
                //*************************Get number Of List Users*************************//
                NumberOfuserWidget(),
                //*************************Show a list Users*************************//
                ListUsersWidget()
              ],
            ),
          );
        }));
  }
}
