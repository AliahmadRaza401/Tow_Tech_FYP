import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tow_tech_fyp/animation/slideanimation.dart';

import 'brandpage.dart';

class Brands extends StatefulWidget {
  var fName, lName, number;
  Brands({this.fName, this.lName, this.number});

  @override
  _BrandsState createState() =>
      _BrandsState(fName: fName, lName: lName, number: number);
}

class _BrandsState extends State<Brands> {
  var fName, lName, number;
  _BrandsState({this.fName, this.lName, this.number});

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
                number: number,
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
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
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
                              child: Column(
                                children: [
                                  card("assets/brands/toyota.png", "Toyota"),
                                  card("assets/brands/bmw.png", "BMW"),
                                  card("assets/brands/audi.png", "Audi"),
                                  card("assets/brands/bentley.png", "Bentley"),
                                  card("assets/brands/ferrari.png", "Ferrari"),
                                  card("assets/brands/honda.png", "Honda"),
                                  card("assets/brands/lamborghini.png",
                                      "Lamborghini"),
                                  card(
                                      "assets/brands/maserati.png", "Maserati"),
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
            ],
          ),
        ),
      ),
    );
  }
}
