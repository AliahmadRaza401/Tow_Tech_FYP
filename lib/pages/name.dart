import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'brands.dart';

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // final db = FirebaseFirestore.instance;

  String fName;
  String lName;
  var number;

  void Validate() {
    if (formkey.currentState.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Brands(
                    fName: fName,
                    lName: lName,
                    number: number,
                  )));
    } else {
      print("UnValid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: new AssetImage(
              'assets/brands/nameBg.jpg',
            ),
          ),
        ),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "  and  ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Number",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                //First NAme
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: new TextFormField(
                    onChanged: (value) {
                      fName = value;
                      // setState(() {
                      //
                      // });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        labelText: 'First Name',
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Last Name
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: new TextFormField(
                    onChanged: (value) {
                      lName = value;
                      // setState(() {
                      //
                      // });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        labelText: 'Last Name',
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Number
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: new TextFormField(
                    onChanged: (value) {
                      number = value;
                      // setState(() {
                      //
                      // });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Required";
                      } else if (value.length < 11) {
                        return "Please Enter Valid Phone Number";
                      } else {
                        return null;
                      }
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        labelText: 'Phone Number',
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Validate();

                    //SAve data into database

                    //Delete all data
                    // FirebaseFirestore.instance.collection('User').get().then((snapshot) {
                    //   for (DocumentSnapshot ds in snapshot.docs){
                    //     ds.reference.delete();
                    //   };
                    // });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(0xffff0000),
                        Color(0xffff9068),
                        Color(0xffff0000)
                      ]),
                    ),
                    child: Center(
                      child: Text(
                        "Enter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
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

  Widget textItem(
      String labeltext, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
