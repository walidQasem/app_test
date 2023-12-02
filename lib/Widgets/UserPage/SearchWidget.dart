import 'package:app_test/Controller/UsersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.put(UserController());
    return Container(
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 69, 69, 69),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 11),
                        labelText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: InputBorder.none),
                    onChanged: (value) {
                      controller.searchUser(value);
                    },
                  ),
                );
  }
}