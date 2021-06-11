import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'ContactClass.dart';
import 'Contact_Data.dart';
import 'SearchWidget.dart';

class SearchContent extends StatefulWidget {
  @override
  SearchContentState createState() => SearchContentState();
}

class SearchContentState extends State<SearchContent> {
  List<ContactClass> contacts;
  String query = '';

  @override
  void initState() {
    super.initState();

    contacts = allContacts;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xffF2F5F8),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: buildBook(contact),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'City Name',
        onChanged: searchBook,
      );

  Widget buildBook(ContactClass contact) => ListTile(
        title: Container(
          height: 90.0,
          padding: EdgeInsets.all(20.0),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        contact.name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        contact.place,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      FlutterPhoneDirectCaller.callNumber(contact.number);
                    },
                    icon: Icon(
                      Icons.call_rounded,
                      color: Colors.green[300],
                      size: 40,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // leading: Text(
        //   contact.number,
        // ),
        // title: Text(contact.name),
        // subtitle: Text(contact.place),
      );

  void searchBook(String query) {
    final books = allContacts.where((book) {
      final placeLower = book.place.toLowerCase();
      final searchLower = query.toLowerCase();

      return placeLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.contacts = books;
    });
  }
}
