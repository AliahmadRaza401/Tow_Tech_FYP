import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tow_tech_fyp/pages/Home/contact_list.dart';

final db = FirebaseFirestore.instance;
var firebaseUser = FirebaseAuth.instance.currentUser;

//dialog
dynamic dialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          ('Notifications'),
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        elevation: 2.0,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .4,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      // .doc(firebaseUser.uid)
                      .where('id', isEqualTo: firebaseUser.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      children: snapshot.data.docs.map((document) {
                        return Column(
                          children: [
                            document['Status'] == ""
                                ? Text("Empty")
                                : document['Status'] == "Approved"
                                    ? approved()
                                    : reject()
                            // document['Status'] == "Rejected"
                            //     ? reject()
                            //     : SizedBox(
                            //         height: 0,
                            //         width: 0,
                            //       ),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    "Note! ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactList()));
                    },
                    child: Text(
                      "Contact support",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  Text(
                    " is available",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Got it'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                textStyle: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      );
    },
  );
}

Widget approved() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    margin: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // document['id'] == firebaseUser.uid
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulations",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your request has been accepted.",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Our service man reached shortly",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget reject() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // document['id'] == firebaseUser.uid
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Upps, Sorry!",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your request has been Rejected.",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "services unavailable",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ],
    ),
  );
}
