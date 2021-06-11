
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tow_tech_fyp/Service/Auth_Service.dart';
import 'package:tow_tech_fyp/pages/Home/home.dart';
import 'package:tow_tech_fyp/pages/name.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MediaQuery.of(context).orientation == Orientation.portrait ?
            portrait() : landscape()
      ),
    );
  }

  Widget colorButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.signInWithEmailAndPassword(
                  email: _emailController.text, password: _pwdController.text);
          print(userCredential.user.email);
          setState(() {
            circular = false;
          });
          fToast.showToast(
            child: toastSucess,
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: 2),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => Home()),
              (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text("Email or Password Not Matched, OR Check Network Connection"));
          // final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          fToast.showToast(
            child: toastFail,
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: 2),
          );
          setState(() {
            circular = false;
          });
        }
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
          child: circular
              ? CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          )
              : Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }

  Widget buttonItem(
      String imagepath, String buttonName, double size, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        child: Card(
          color: Colors.black,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagepath,
                height: size,
                width: size,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
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

  //Portrait
Widget portrait(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/wlogo.png',
              width: MediaQuery.of(context).size.width * .3,
              // height: MediaQuery.of(context),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Sign In",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buttonItem("assets/google.svg", "Continue with Google", 25, () {
            authClass.googleSignIn(context);
          }),
          // SizedBox(
          //   height: 15,
          // ),
          // buttonItem("assets/phone.svg", "Continue with Mobile", 30, () {}),
          SizedBox(
            height: 18,
          ),
          Text(
            "Or",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 18,
          ),
          textItem("Email....", _emailController, false),
          SizedBox(
            height: 15,
          ),
          textItem("Password...", _pwdController, true),
          SizedBox(
            height: 40,
          ),
          colorButton(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "If you don't have an Account? ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => SignUpPage()),
                          (route) => false);
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
}

  //Landscape
  Widget landscape(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/wlogo.png',
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.height * .2,

                  // height: MediaQuery.of(context),
                ),
              ],
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buttonItem("assets/google.svg", "Continue with Google", 25, () {
              authClass.googleSignIn(context);
            }),
            // SizedBox(
            //   height: 15,
            // ),
            // buttonItem("assets/phone.svg", "Continue with Mobile", 30, () {}),
            SizedBox(
              height: 18,
            ),
            Text(
              "Or",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 18,
            ),
            textItem("Email....", _emailController, false),
            SizedBox(
              height: 15,
            ),
            textItem("Password...", _pwdController, true),
            SizedBox(
              height: 40,
            ),
            colorButton(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you don't have an Account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => SignUpPage()),
                            (route) => false);
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Toast Message
  Widget toastSucess = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xffff9068),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.lock_open_rounded),
        SizedBox(
          width: 12.0,
        ),
        Text("Login Successfully"),
      ],
    ),
  );
  Widget toastFail = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xffff9068),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.lock_outline_sharp),
        SizedBox(
          width: 12.0,
        ),
        Text("Login Failed"),
      ],
    ),
  );


}
