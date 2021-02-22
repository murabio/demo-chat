import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Me {
  static final Me _appData = new Me._internal();

  String id;
  String nickname;
  String photoUrl;
  String aboutMe;

  void setMe(User currentUser) {
    id = currentUser.uid;
    nickname = currentUser.displayName;
    photoUrl = currentUser.photoURL;
  }

  void loadMe(DocumentSnapshot document) {
    id = document.data()['id'];
    nickname = document.data()['nickname'];
    photoUrl = document.data()['photoUrl'];
    aboutMe = document.data()['aboutMe'];
  }

  factory Me() {
    return _appData;
  }
  Me._internal();
}
final me = Me();