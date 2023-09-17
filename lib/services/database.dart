import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/user.dart';
import 'package:app/models/time_study.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference studyCollection = FirebaseFirestore.instance.collection('study');
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');
  Future updateDatabase(String? hour, String? minutes, String? name, String? owner, String? subject,
      String? loading, String? description, String? add) async {
    return await studyCollection.doc(uid).set({
      'hour': hour,
      'minutes': minutes,
      'name': name,
      'owner': owner,
      'subject': subject,
      'loading': loading,
      'description': description,
      'add': add
    });
  }

  Future updateProfile(String? name, String? username, String? age, String? address, String? gender,
      String? cpa, String? school, String? uid, String? asset) async {
    return await profileCollection.doc(uid).set({
      'name': name,
      'username': username,
      'age': age,
      'address': address,
      'gender': gender,
      'cpa': cpa,
      'school': school,
      'uid': uid,
      'asset': asset
    });
  }

  List<Auth> _authDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Auth(
        address: doc.data().toString().contains('address') ? doc.get('address') : '',
        school: doc.data().toString().contains('school') ? doc.get('school') : '',
        age: doc.data().toString().contains('age') ? doc.get('age') : '',
        cpa: doc.data().toString().contains('cpa') ? doc.get('cpa') : '',
        gender: doc.data().toString().contains('gender') ? doc.get('gender') : '',
        name: doc.data().toString().contains('name') ? doc.get('name') : '',
        username: doc.data().toString().contains('username') ? doc.get('username') : '',
        uid: doc.data().toString().contains('uid') ? doc.get('uid') : '',
        asset: doc.data().toString().contains('asset') ? doc.get('asset') : '',
      );
    }).toList();
  }

  Stream<List<Auth>> get authData {
    return profileCollection.snapshots().map((_authDataFromSnapshot));
  }

  List<TimeStudy> _studyDataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return TimeStudy(
          hour: doc.data().toString().contains('hour') ? doc.get('hour') : '',
          minutes: doc.data().toString().contains('minutes') ? doc.get('minutes') : '',
          name: doc.data().toString().contains('name') ? doc.get('name') : '',
          owner: doc.data().toString().contains('owner') ? doc.get('owner') : '',
          subjects: doc.data().toString().contains('subject') ? doc.get('subject') : '',
          loading: doc.data().toString().contains('loading') ? doc.get('loading') : '',
          description: doc.data().toString().contains('description') ? doc.get('description') : '',
          add: doc.data().toString().contains('add') ? doc.get('add') : '');
    }).toList();
  }

  Stream<List<TimeStudy>> get studyData {
    return studyCollection.snapshots().map(_studyDataFromSnapshot);
  }
}
