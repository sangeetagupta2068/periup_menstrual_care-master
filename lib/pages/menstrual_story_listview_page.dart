import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:periup/data_models/menstrual_story_post.dart';
import 'package:periup/utils/firebase_database_connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenstrualCommunityPage extends StatefulWidget {
  @override
  MenstrualCommunityPageState createState() => MenstrualCommunityPageState();
}

class MenstrualCommunityPageState extends State<MenstrualCommunityPage> {
  FirebaseDataBaseConnectivty firebaseDataBaseConnectivty =
      new FirebaseDataBaseConnectivty();

  List<MenstrualStoryPost> _posts = [];

  Firestore firestore = Firestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void _setLikes(MenstrualStoryPost postItem) async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    firestore
        .collection('post')
        .document(postItem.userEmail + postItem.dateTimeOfPost)
        .collection('likes')
        .document()
        .setData({
      'liked_user': firebaseUser.email,
    }).whenComplete(() {
      setState(() {
        postItem.likeFlag = true;
      });
    });
    firestore
        .collection('post')
        .document(postItem.userEmail + postItem.dateTimeOfPost)
        .collection('likes')
        .getDocuments()
        .then((snap) {
      postItem.likeCount = snap.documents.length;
    });
    // ;          .collec
// tion('likes').document(firebaseUser.email + DateTime.now().toIso8601String());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    if (_posts.length == 0) {
      return Center(
        child: Text("no posts yet."),
      );
    }
    return ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, position) {
          return Card(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 14.0, bottom: 14.0, left: 12.0, right: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _posts[position].photoUrl!=null?Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    NetworkImage(_posts[position].photoUrl))),
                      ) : Icon(Icons.account_circle),
                      Text(
                        " " + _posts[position].authorName,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(_posts[position].content),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Published on " + _posts[position].dateTimeOfPost,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.sentiment_satisfied,
                          color: _posts[position].likeFlag
                              ? Colors.yellow
                              : Colors.blueGrey,
                        ),
                        onTap: () {
                          _setLikes(_posts[position]);
                        },
                      ),
                      Text("  "),
                      Text(_posts[position].likeCount.toString()),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _getData() async {
    firestore.collection('post').getDocuments().then((snapshot) {
      snapshot.documents.forEach((document) {
        _posts.add(MenstrualStoryPost(
            userEmail: document.data['author_email'],
            photoUrl: document.data['author_pic'],
            dateTimeOfPost: document.data['post_published_at'],
            authorName: document.data['author_name'],
            content: document.data['post_content']));
      });
      setState(() {});
    });
  }
}
