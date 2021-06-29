import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tow_tech_fyp/pages/Home/map.dart';

class WithinCity extends StatefulWidget {
  @override
  _WithinCityState createState() => _WithinCityState();
}

class _WithinCityState extends State<WithinCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? portrait()
          : landScape(),
    );
  }

  // LandScape
  Widget landScape() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.red,
            // image: new DecorationImage(
            //   fit: BoxFit.fill,
            //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //   image: new AssetImage(
            //     'assets/cars/cars.jpg',
            //   ),
            // ),
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffff0000), Color(0xffed5a5a)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Within City",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/logo/road.png",
                              width: MediaQuery.of(context).size.width * 0.1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.53,
            decoration: BoxDecoration(
              color: Color(0xffF2F5F8),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70), topLeft: Radius.circular(70)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 30, bottom: 30),
                    child: Row(
                      children: [
                        Text(
                          "What do you Need?",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (await Permission.location
                                  .request()
                                  .isGranted) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Map(
                                              cityType: "WithIn City",
                                              service: "Technician",
                                            )));
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/logo/techlogo.png",
                                                width: 50,
                                              ),
                                              Text(
                                                "  Technician",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.redAccent,
                                        size: 35,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (await Permission.location
                                  .request()
                                  .isGranted) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Map(
                                              cityType: "WithIn City",
                                              service: "Towing Truck",
                                            )));
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/logo/towlogo.png",
                                            width: 90,
                                          ),
                                          Text(
                                            "Tow Vehicle",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.redAccent,
                                        size: 35,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Portraite
  Widget portrait() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            // image: new DecorationImage(
            //   fit: BoxFit.fill,
            //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //   image: new AssetImage(
            //     'assets/cars/cars.jpg',
            //   ),
            // ),
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffff0000), Color(0xffed5a5a)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
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
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Within City",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/logo/road.png",
                              width: MediaQuery.of(context).size.width * 0.3),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Color(0xffF2F5F8),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70), topLeft: Radius.circular(70)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 30, bottom: 70),
                  child: Row(
                    children: [
                      Text(
                        "What do you Need?",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.fromLTRB(35, 15, 20, 15),
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
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/logo/techlogo.png",
                                      width: 50,
                                    ),
                                    Text(
                                      "  Technician",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.redAccent,
                              size: 35,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/logo/towlogo.png",
                                  width: 90,
                                ),
                                Text(
                                  "Tow Vehicle",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.redAccent,
                              size: 35,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
