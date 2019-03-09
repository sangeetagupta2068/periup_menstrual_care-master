//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:periup/data_models/doctor.dart';
//import 'package:periup/data_models/menstrual_story_post.dart';
//import 'package:periup/utils/firebase_database_connectivity.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class DoctorListViewPage extends StatefulWidget {
//  @override
//  DoctorListViewPageState createState() => DoctorListViewPageState();
//}
//
//class DoctorListViewPageState extends State<DoctorListViewPage> {
//  FirebaseDataBaseConnectivty firebaseDataBaseConnectivty =
//  new FirebaseDataBaseConnectivty();
//
//  List<Doctor> _doctors = [];
//
//  Firestore firestore = Firestore.instance;
//  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//  void _setLikes(Doctor doctorItem) async {
//    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
//    firestore
//        .collection('doctor')
//        .document(doctorItem.email)
//        .collection('likes')
//        .document()
//        .setData({
//      'liked_user': firebaseUser.email,
//    }).whenComplete(() {
//      setState(() {
//        doctorItem.likeFlag = true;
//      });
//    });
//    firestore
//        .collection('doctor')
//        .document(doctorItem.email)
//        .collection('likes')
//        .getDocuments()
//        .then((snap) {
//      doctorItem.likeCount = snap.documents.length;
//    });
//    // ;          .collec
//// tion('likes').document(firebaseUser.email + DateTime.now().toIso8601String());
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _getData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (_doctors.length == 0) {
//      return Center(
//        child: Text("no doctors yet."),
//      );
//    }
//    return ListView.builder(
//        itemCount: _doctors.length,
//        itemBuilder: (context, position) {
//          return Card(
//            elevation: 5.0,
//            child: Padding(
//              padding: const EdgeInsets.only(
//                  top: 14.0, bottom: 14.0, left: 12.0, right: 12.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      _doctors[position].photoUrl!=null?Container(
//                        height: 50,
//                        width: 50,
//                        decoration: BoxDecoration(
//                            shape: BoxShape.circle,
//                            image: DecorationImage(
//                                image:
//                                NetworkImage(_posts[position].photoUrl))),
//                      ) : Icon(Icons.account_circle),
//                      Text(
//                        " " + _doctors[position].authorName,
//                        style: TextStyle(color: Colors.redAccent),
//                      ),
//                    ],
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: Text(_doctors[position].content),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(left: 10.0),
//                    child: Text(
//                      "Published on " + _doctors[position].dateTimeOfPost,
//                      style: TextStyle(color: Colors.blueGrey),
//                    ),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      GestureDetector(
//                        child: Icon(
//                          Icons.sentiment_satisfied,
//                          color: _doctors[position].likeFlag
//                              ? Colors.yellow
//                              : Colors.blueGrey,
//                        ),
//                        onTap: () {
//                          _setLikes(_doctors[position]);
//                        },
//                      ),
//                      Text("  "),
//                      Text(_doctors[position].likeCount.toString()),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          );
//        });
//  }
//
//  void _getData() async {
//    firestore.collection('post').getDocuments().then((snapshot) {
//      snapshot.documents.forEach((document) {
//        _doctors.add(Doctor(
//            email: document.data['email'],
//            hospitalName: document.data['hospital_name'],
//            dateOfBirth: document.data['date_of_birth'],
//            : document.data['author_name'],
//            content: document.data['post_content']));
//      });
//      setState(() {});
//    });
//  }
//}
