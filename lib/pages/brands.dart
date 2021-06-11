import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tow_tech_fyp/animation/slideanimation.dart';

import 'brandpage.dart';


class Brands extends StatefulWidget {

  var fName, lName;
  Brands({this.fName,this.lName});

  @override
  _BrandsState createState() => _BrandsState(fName: fName, lName: lName);
}

class _BrandsState extends State<Brands> {

  var fName, lName;
  _BrandsState({this.fName,this.lName});

  @override
  Widget build(BuildContext context) {

    Widget card(String brandURl, brandName) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            SlideBottomRoute(
              page: BrandPage(
                brand: brandName,
                logo: brandURl,
                fName: fName,
                lName: lName,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        brandURl,
                        width: 85,
                      )),
                ],
              ),
              Column(
                children: [
                  Text(
                    brandName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xffff0000), Color(0xffed5a5a)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30,),
                          onPressed: (){
                          Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Select Your Brand",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width * 0.9,
                                child:
                                Column(
                                  children: [
                                    card("assets/brands/toyota.png", "Toyota"),
                                    card("assets/brands/bmw.png", "BMW"),
                                    card("assets/brands/audi.png", "Audi"),
                                    card("assets/brands/bentley.png", "Bentley"),
                                    card("assets/brands/ferrari.png", "Ferrari"),
                                    card("assets/brands/honda.png", "Honda"),
                                    card("assets/brands/lamborghini.png", "Lamborghini"),
                                    card("assets/brands/maserati.png", "Maserati"),
                                    card("assets/brands/porsche.png", "Porsche"),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius:
              //         BorderRadius.only(topRight: Radius.circular(30)),
              //         color: Colors.white),
              //     width: MediaQuery.of(context).size.width * 0.95,
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //     height: 600,
              //     child: ListView(
              //       children: [
              //         card("assets/brands/bmw.png", "BMW"),
              //         card("assets/brands/audi.png", "Audi"),
              //         card("assets/brands/bentley.png", "Bentley"),
              //         card("assets/brands/ferrari.png", "Ferrari"),
              //         card("assets/brands/honda.png", "Honda"),
              //         card("assets/brands/lamborghini.png", "Lamborghini"),
              //         card("assets/brands/maserati.png", "Maserati"),
              //         card("assets/brands/porsche.png", "Porsche"),
              //         card("assets/brands/toyota.png", "Toyota"),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Brands extends StatefulWidget {
//   String name;
//   Brands({this.name});
//
//   @override
//   _BrandsState createState() => _BrandsState(name: name);
// }
//
// class _BrandsState extends State<Brands> {
//
//   String name;
//   _BrandsState({this.name});
//
//   @override
//   Widget build(BuildContext context) {
//
//     Widget card(String brandURl, brandName){
//       return Container(
//         padding: EdgeInsets.symmetric(vertical: 5),
//         margin: EdgeInsets.symmetric(vertical: 5),
//         decoration: BoxDecoration(
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 3,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//             ],
//             borderRadius: BorderRadius.circular(10),
//           color: Colors.white
//         ),
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Image.asset(brandURl, width: 75,)),
//               ],
//             ),
//             Column(
//               children: [
//                 Text(brandName, style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600
//                 ),)
//               ],
//             ),
//           ],
//         ),
//       );
//     }
//
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             decoration: new BoxDecoration(
//               gradient: new LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   Color(0xffff0000),
//                   Color(0xffed5a5a)
//                 ],
//               ),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 50, left: 30, bottom: 40),
//                   child: Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text("WellCome!", style: TextStyle(
//                                 fontSize: 34,
//                                 fontWeight: FontWeight.w800,
//                                 color: Colors.white
//                             ),),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(name, style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white
//
//                             ),),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Select Your Brand:", style:
//                       TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
//                 color: Colors.white
//               ),
//               width: MediaQuery.of(context).size.width * 0.95,
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//               height: 420,
//               child: ListView(
//                 children: [
//                   card("assets/brands/bmw.png", "BMW"),
//                   card("assets/brands/audi.png", "Audi"),
//                   card("assets/brands/bentley.png", "Bentley"),
//                   card("assets/brands/ferrari.png", "Ferrari"),
//                   card("assets/brands/honda.png", "Honda"),
//                   card("assets/brands/lamborghini.png", "Lamborghini"),
//                   card("assets/brands/maserati.png", "Maserati"),
//                   card("assets/brands/porsche.png", "Porsche"),
//                   card("assets/brands/toyota.png", "Toyota"),
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
