import 'package:app/models/group.dart';
import 'package:app/models/user.dart';
import 'package:flutter/material.dart';

class ChatInstance {
  final Group group;
  final Auth fromUser;
  String content;
  final Icon? icon;
  final Image? image;

  ChatInstance({
    required this.group,
    required this.fromUser,
    this.content = '',
    this.icon,
    this.image,
  });
}
