import 'package:app/pages/single_chat_screen.dart';
import 'package:app/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OverallChatScreen extends StatefulWidget {
  const OverallChatScreen({super.key});

  @override
  State<OverallChatScreen> createState() => _OverallChatScreenState();
}

class _OverallChatScreenState extends State<OverallChatScreen> {
  final searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomTextInput(
              labelText: 'Search',
              controller: searchEditingController,
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          ...List.generate(
            20,
            (index) {
              return InkWell(
                onTap: () {
                  Get.to(
                    () => SingleChatScreen(
                      groupName: 'Group #$index',
                    ),
                  );
                },
                child: ListTile(
                  title: Text('Group #$index'),
                  subtitle: Text('You: Lorem ipsum dolor #$index'),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.group),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
