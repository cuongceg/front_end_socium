import 'package:app/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleChatScreen extends StatefulWidget {
  final String groupName;

  const SingleChatScreen({super.key, required this.groupName});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: ListTile(
          title: Text(
            this.widget.groupName,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge,
          ),
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.group),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(Icons.call_rounded),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(Icons.video_chat_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth / 2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.group),
                ),
                title: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Hello world',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        IconButton(
          icon: const Icon(Icons.photo_camera),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.photo),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.mic),
          onPressed: () {},
        ),
        SizedBox(
          width: screenWidth / 1.75,
          child: const CustomTextInput(
            hintText: 'Type message here...',
          ),
        ),
        IconButton(
          icon: const Icon(Icons.thumb_up),
          onPressed: () {},
        ),
      ],
    );
  }
}
