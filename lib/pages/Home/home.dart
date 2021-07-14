import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tow_tech_fyp/Service/Auth_Service.dart';
import 'package:tow_tech_fyp/Widget/dialog.dart';
import 'package:tow_tech_fyp/pages/Home/cityTocity.dart';
import 'package:tow_tech_fyp/pages/Home/contact.dart';
import 'package:tow_tech_fyp/pages/Home/map.dart';
import 'package:tow_tech_fyp/pages/Home/withinCity.dart';
import 'package:tow_tech_fyp/pages/SignUpPage.dart';

class Home extends StatefulWidget {
  // String fName, lName;
  // Home({this.fName,this.lName});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF2F5F8),
        // padding: EdgeInsets.only(bottom: 30),
        child: SingleChildScrollView(
            child: MediaQuery.of(context).orientation == Orientation.portrait
                ? homePortrait()
                : homeLandscape()),
      ),
    );
  }

//Home Portrait
  Widget homePortrait() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.33,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            image: new DecorationImage(
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(1), BlendMode.dstATop),
              image: new AssetImage(
                'assets/cars/bg3.jpg',
              ),
            ),
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffff0000), Color(0xffed5a5a)],
            ),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "WellCome!",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                        Column(children: [
                          IconButton(
                              icon: Icon(
                                Icons.logout,
                                size: 30,
                              ),
                              onPressed: () async {
                                await authClass.logout();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => SignUpPage()),
                                    (route) => false);
                              })
                        ]),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text("In", style: TextStyle(
                    //       fontSize: 20
                    //     ),)
                    //   ],
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // getName(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Tow & ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Tech",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.notifications_active,
                                  size: 30,
                                ),
                                onPressed: () {
                                  dialog(context);
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => Notifi()));
                                })
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 150,
          // color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WithinCity()));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder:
                      //         (context) => WithinCity(latitude: latitude,longitude: longitude)));
                    },
                    child: Container(
                      width: 90,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffff0000),
                          Color(0xffff9068),
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset("assets/logo/road.png", height: 75),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Within City",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityToCity()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> CityToCity(latitude: latitude,longitude: longitude,)));
                    },
                    child: Container(
                      width: 90,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffff0000),
                          Color(0xffff9068),
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/logo/city.png",
                              height: 75,
                              width: 55,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "City To City",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contact()));
                    },
                    child: Container(
                      width: 90,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffff0000),
                          Color(0xffff9068),
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/logo/fmagent.png",
                              height: 85,
                              width: 70,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Contact",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // City TO City
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF3D2C2C),
                    Color(0xffed5a5a),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tow Vehicle",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "We are providing the best Tow service for your imported car in an emergency.we are available click and book now our Services",
                      style: TextStyle(
                          color: Color(0xffFFE5E3E3),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffff0000)),
                    ),
                    onPressed: () async {
                      if (await Permission.location.request().isGranted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Map(
                                      cityType: "WithIn City",
                                      service: "Towing Truck",
                                    )));
                      }
                    },
                    child: Text("Book Now"),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: -20,
                right: 0,
                child: Image.asset(
                  "assets/cars/rcar.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ))
          ],
        ),
        // Technician
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF3D2C2C),
                    Colors.blueGrey,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Technician",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "If you are stuck in the road. Don't worry, click now and get the services from our experienced Tecnician",
                      style: TextStyle(
                          color: Color(0xffFFE5E3E3),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffff0000)),
                      ),
                      onPressed: () async {
                        if (await Permission.location.request().isGranted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Map(
                                        cityType: "WithIn City",
                                        service: "Technician",
                                      )));
                        }
                      },
                      child: Text("Book Now"))
                ],
              ),
            ),
            Positioned(
                bottom: -45,
                right: 0,
                child: Image.asset(
                  "assets/cars/tech.webp",
                  width: MediaQuery.of(context).size.width * 0.45,
                )),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        // Contact
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF3D2C2C),
                    Colors.blue,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Support",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Search number your nearest Technician and Tow Truck in your home town",
                      style: TextStyle(
                          color: Color(0xffFFE5E3E3),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffff0000)),
                      ),
                      onPressed: () async {
                        if (await Permission.location.request().isGranted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact()));
                        }
                      },
                      child: Text("Book Now"))
                ],
              ),
            ),
            Positioned(
                bottom: -30,
                right: 0,
                child: Image.asset(
                  "assets/cars/pinkcar.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 150,
                ))
          ],
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }

  //Home Landscape
  Widget homeLandscape() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: Colors.red,
            image: new DecorationImage(
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(1), BlendMode.dstATop),
              image: new AssetImage(
                'assets/cars/bg3.jpg',
              ),
            ),
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffff0000), Color(0xffed5a5a)],
            ),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "WellCome!",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      Column(children: [
                        IconButton(
                            icon: Icon(
                              Icons.logout,
                              size: 30,
                            ),
                            onPressed: () async {
                              await authClass.logout();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => SignUpPage()),
                                  (route) => false);
                            })
                      ]),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text("In", style: TextStyle(
                  //       fontSize: 20
                  //     ),)
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // getName(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tow & ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Tech",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.notifications_active,
                                size: 30,
                              ),
                              onPressed: () {
                                dialog(context);
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => Notifi()));
                              })
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 150,
          // color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Map()));
                    },
                    child: Container(
                      width: 110,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffff0000),
                          Color(0xffff9068),
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset("assets/logo/road.png", height: 75),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Within City",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Map()));
                    },
                    child: Container(
                      width: 110,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffff0000),
                          Color(0xffff9068),
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/logo/city.png",
                              height: 75,
                              width: 65,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "City To City",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Map()));
                    },
                    child: Container(
                      width: 110,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffff0000),
                          Color(0xffff9068),
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/logo/techlogo.png",
                              height: 75,
                              width: 65,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Technician",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // City TO City
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF3D2C2C),
                    Color(0xffed5a5a),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "City To City",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "By using remove.bg you agree to the use of cookies. You can find details on how we use cookies in our Cookie Policy.",
                      style: TextStyle(
                          color: Color(0xffFFE5E3E3),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffff0000)),
                    ),
                    onPressed: () async {
                      if (await Permission.location.request().isGranted) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Map()));
                      }
                    },
                    child: Text("Book Now"),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: -30,
                right: 0,
                child: Image.asset(
                  "assets/cars/rcar.png",
                  width: MediaQuery.of(context).size.width * 0.35,
                ))
          ],
        ),
        // With in City
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF3D2C2C),
                    Colors.blue,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Within City",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "By using remove.bg you agree to the use of cookies. You can find details on how we use cookies in our Cookie Policy.",
                      style: TextStyle(
                          color: Color(0xffFFE5E3E3),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffff0000)),
                      ),
                      onPressed: () async {
                        if (await Permission.location.request().isGranted) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Map()));
                        }
                      },
                      child: Text("Book Now"))
                ],
              ),
            ),
            Positioned(
                bottom: -30,
                right: 0,
                child: Image.asset(
                  "assets/cars/bcar.webp",
                  width: MediaQuery.of(context).size.width * 0.30,
                ))
          ],
        ),
        // Technician
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF3D2C2C),
                    Colors.blueGrey,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Technician",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "By using remove.bg you agree to the use of cookies. You can find details on how we use cookies in our Cookie Policy.",
                      style: TextStyle(
                          color: Color(0xffFFE5E3E3),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffff0000)),
                      ),
                      onPressed: () async {
                        // _getCurrentLocation();
                        if (await Permission.location.request().isGranted) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Map()));
                        }
                      },
                      child: Text("Book Now"))
                ],
              ),
            ),
            Positioned(
                bottom: -50,
                right: 0,
                child: Image.asset(
                  "assets/cars/tech.webp",
                  width: MediaQuery.of(context).size.width * 0.3,
                )),
          ],
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }

// _getCurrentLocation() async{
//   if (await Permission.location.request().isGranted)
//     {
//
//     print("getting current Location");
//     Geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
//         .then((Position position) {
//     setState(() {
//     _currentPosition = position;
//     latitude = _currentPosition.latitude;
//     longitude = _currentPosition.longitude;
//     map = true;
//     });
//     print("---------- Get Location  ---------------- + $latitude");
//     // Navigator.pushReplacement(context, MaterialPageRoute(builder:
//     //     (context)=> Map()));
//     }).catchError((e) {
//     print(e);
//     });
//
//     }
// }

}
