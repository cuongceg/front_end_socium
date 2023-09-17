import 'package:app/models/user.dart';

class Group {
  final String name;
  List<Auth>? users;
  Group(this.name, this.users);
}
