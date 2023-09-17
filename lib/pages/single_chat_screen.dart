import 'package:app/models/chat_instance.dart';
import 'package:app/models/group.dart';
import 'package:app/models/user.dart';
import 'package:app/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SingleChatScreen extends StatefulWidget {
  final String groupName;

  const SingleChatScreen({super.key, required this.groupName});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  final List<ChatInstance> _chatInstances = [];
  bool _sendable = false;
  final chatInputController = TextEditingController();

  void _toggleSendable(String content) {
    setState(() => _sendable = content.trim().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final authList = Provider.of<List<Auth>?>(context);
    final Group group = Group(widget.groupName, authList);

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
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(Icons.video_chat_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _chatInstances.length,
        itemBuilder: (context, index) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth / 2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.group),
                ),
                title: _chatInstances[index].content.isEmpty
                    ? (_chatInstances[index].icon != null
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: _chatInstances[index].icon,
                          )
                        : _chatInstances[index].image)
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          _chatInstances[index].content,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.end,
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
          onPressed: () {
            _pickImageFromCamera(group);
          },
        ),
        IconButton(
          icon: const Icon(Icons.photo),
          onPressed: () {
            _pickImageFromGallery(group);
          },
        ),
        IconButton(
          icon: const Icon(Icons.mic),
          onPressed: () {},
        ),
        SizedBox(
          width: screenWidth / 1.75,
          child: CustomTextInput(
            controller: chatInputController,
            hintText: 'Type message here...',
            onChanged: _toggleSendable,
          ),
        ),
        IconButton(
          icon: Icon(_sendable ? Icons.send : Icons.thumb_up),
          onPressed: () => _sendMessage(group),
        ),
      ],
    );
  }

  Future _pickImageFromGallery(Group group) async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _chatInstances.add(
        ChatInstance(
          group: group,
          fromUser: group.users![0],
          image: Image.network(returnedImage.path),
        ),
      );
    });
  }

  Future _pickImageFromCamera(Group group) async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _chatInstances.add(
        ChatInstance(
          group: group,
          fromUser: group.users![0],
          image: Image.network(returnedImage.path),
        ),
      );
    });
  }

  void _sendMessage(Group group) {
    setState(
      () {
        final chatContent = chatInputController.text.trim();
        _chatInstances.add(
          ChatInstance(
            group: group,
            fromUser: group.users![0],
            content: chatContent.isNotEmpty ? chatContent : '',
            icon: chatContent.isEmpty
                ? const Icon(
                    Icons.thumb_up,
                    color: Colors.black87,
                  )
                : null,
          ),
        );

        chatInputController.text = '';
        _sendable = false;
      },
    );
  }
}
