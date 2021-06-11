import 'package:flutter/material.dart';

import 'ContactsSearch/content.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5F8),
      appBar: AppBar(
        backgroundColor: Color(0xffff0000),
        title: Text(
          'Contact List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .88,
                child: SearchContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
