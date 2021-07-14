import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tow_tech_fyp/pages/Home/home.dart';

class Map extends StatefulWidget {
  var cityType, service;
  Map({this.cityType, this.service});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  Position _currentPosition;
  var latitude;
  var longitude;
  bool loading = false;
  FToast fToast;
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    print(widget.cityType);
    print(widget.service);
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    print("------------------------------Getting Location--------------------");
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        loading = true;
        _currentPosition = position;
        latitude = _currentPosition.latitude;
        longitude = _currentPosition.longitude;
      });
      print("----------Current Location----------------- + $_currentPosition");
    }).catchError((e) {
      print(e);
    });
  }

  updateDataIntoDatabase() {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    try {
      db.collection("Users").doc(firebaseUser.uid).update({
        "CityType": widget.cityType,
        "Services": widget.service,
        "Location.latitude": latitude,
        "Location.longitude": longitude,
      }).then((_) {
        print("success!");
      });
      showAlertDialog();
      // fToast.showToast(
      //     child: toast("Location Save Successfully!"),
      //     toastDuration: Duration(seconds: 4),
      //     positionedToastBuilder: (context, child) {
      //       return Positioned(
      //         child: child,
      //         left: MediaQuery.of(context).size.width * 0.2,
      //         bottom: 250,
      //       );
      //     });
    } catch (e) {
      fToast.showToast(
          child: toast(e),
          toastDuration: Duration(seconds: 4),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              left: MediaQuery.of(context).size.width * 0.2,
              bottom: 250,
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final CameraPosition _initPosition = CameraPosition(
    //   // target: LatLng(37.42796133580664, -122.085749655962),
    //     target: LatLng(latitude,longitude),
    //     zoom: 14.5
    // );

    return Scaffold(
      backgroundColor: Color(0xffF2F5F8),
      appBar: AppBar(
        backgroundColor: Color(0xffff0000),
        title: Text("Google Map"),
      ),
      body: SingleChildScrollView(
        child: loading == true
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          // target: LatLng(37.42796133580664, -122.085749655962),
                          target: LatLng(latitude, longitude),
                          zoom: 14.5),
                      onMapCreated: (GoogleMapController contoller) {
                        _controller.complete(contoller);

                        setState(() {
                          _markers.add(Marker(
                              markerId: MarkerId("init Mark_1"),
                              position: LatLng(latitude, longitude)));
                        });
                      },
                      mapType: MapType.normal,
                      markers: _markers,
                      zoomGesturesEnabled: true,
                      // minMaxZoomPreference: MinMaxZoomPreference(15, 19),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateDataIntoDatabase();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 100),
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
                          "Save Location",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : loadingScreen(),
      ),
    );
  }

  Widget loadingScreen() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffff0000)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please wait Map is",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Loading...",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

// Widget buildSearchbar(){
//   return SearchMapPlaceWidget(
//     apiKey: "AIzaSyCxA4sUW9waJLYV1vaAn9DUZlCvpETXvq0",
//     placeholder: "Enter the location",
//     placeType: PlaceType.address,
//     onSelected: (Place place) async {
//       print('Slected Place ++++++++++ '+place.description);
//       final geolocation = await place.geolocation;
//       geolocation.coordinates;
//       // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
//       // final GoogleMapController controller = await _mapController.future;
//       // controller.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
//       // controller.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
//     },
//
//   );
// }

  toast(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xffff9068),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // login alert
  showAlertDialog() {
    setState(() {
      // _loading = false;
    });
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Okay"),
      onPressed: () {
        // Navigator.pop(context);
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (context) => Home()));
      },
    );
    // Widget continueButton = FlatButton(
    //   child: Text("Continue"),
    //   onPressed: () {
    //     // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=> UserRegistration(userMobile:mobileController.text)));
    //   },
    // );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Location Save Successfully!",
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "Go to Home Page verify approval Notification",
        // style: TextStyle(fontSize: 18,fontFamily: Variable.fontStyle),
      ),
      actions: [
        cancelButton,
        // continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
