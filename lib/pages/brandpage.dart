import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home/home.dart';

class BrandPage extends StatefulWidget {
  String brand, logo, fName, lName, number;

  BrandPage({this.brand, this.logo, this.fName, this.lName, this.number});

  @override
  _BrandPageState createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  @override
  void initState() {
    checkBrandName();
    print(widget.fName);
    super.initState();
  }

  final TextEditingController _controller = new TextEditingController();
  final db = FirebaseFirestore.instance;
  // User firebaseUser = FirebaseAuth.instance.currentUser;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  var items, vehLex, vehNumber;

  String dropdownValue = 'Select Your Vehicle';

  checkBrandName() {
    var brand = widget.brand;

    switch (brand) {
      case "Toyota":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Toyota 1",
              "Toyota 2",
              "Toyota 3",
            ]
          };
        }
        break;

      case "BMW":
        {
          return {
            items = [
              "Select Your Vehicle",
              "BMW 1",
              "BMW 2",
              "BMW 3",
            ]
          };
        }
        break;
      //
      case "Audi":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Audi 1",
              "Audi 2",
              "Audi 3",
            ]
          };
        }
        break;

      case "Bentley":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Bentley 1",
              "Bentley 2",
              "Bentley 3",
            ]
          };
        }
        break;

      case "Ferrari":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Ferrari 1",
              "Ferrari 2",
              "Ferrari 3",
            ]
          };
        }
        break;

      case "Honda":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Honda 1",
              "Honda 2",
              "Honda 2",
            ]
          };
        }
        break;

      case "Lamborghini":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Lamborghini 1",
              "Lamborghini 2",
              "Lamborghini 3",
            ]
          };
        }
        break;

      case "Maserati":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Maserati 1",
              "Maserati 2",
              "Maserati 3",
            ]
          };
        }
        break;

      case "Porsche":
        {
          return {
            items = [
              "Select Your Vehicle",
              "Porsche 1",
              "Porsche 2",
              "Porsche 3",
            ]
          };
        }
        break;
    }
  }

  dataSaveIntoFirebase() {
    db.collection("Users").doc(firebaseUser.uid).set({
      "First Name": widget.fName,
      "Last Name": widget.lName,
      "Number": widget.number,
      "Vehicale": widget.brand,
      "Sub_Vehicale": dropdownValue,
      "Vehicale_LEX": vehLex,
      "Vehicale_Number": vehNumber,
      "Services": "",
      "CityType": "",
      "Location": {"latitude": "", "longitude": ""},
      "Status": "",
      "id": firebaseUser.uid
    }, SetOptions(merge: true)).then((_) {
      print("Data Save Success!");
    });

    // db.collection("User").add({
    //   "First Name": widget.fName,
    //   "Last Name" : widget.lName,
    //   "Vehicale" : widget.brand,
    //   "Sub_Vehicale" : dropdownValue,
    //   "Vehicale_LEX" : Lex,
    //   "Vehicale_Number" : Number,
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 170),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffff0000), Color(0xffed5a5a)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                //Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.brand,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: [Text("                ")],
                    ),
                  ],
                ),
                //Body
                Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage(widget.logo),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                //Drop Down Menu
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_sharp),
                    iconSize: 40,
                    elevation: 16,
                    iconEnabledColor: Colors.white,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    isExpanded: true,
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.white,
                    // ),
                    dropdownColor: Colors.red,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.car_repair,
                              color: Colors.white,
                              size: 30,
                            ),
                            Container(
                              width: 110,
                              child: TextFormField(
                                onChanged: (value) {
                                  vehLex = value;
                                },
                                decoration: new InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.yellow, width: 2.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  hintText: 'LEX',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        child: TextFormField(
                          onChanged: (value) {
                            vehNumber = value;
                          },
                          decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 2.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            hintText: '1234',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 100.0),
                  width: MediaQuery.of(context).size.width * .9,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      dataSaveIntoFirebase();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 22.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
