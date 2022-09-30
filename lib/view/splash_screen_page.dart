import 'dart:async';
import 'package:farm_flutter/Screens/Signup/components/signup_form.dart';
import 'package:farm_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:farm_flutter/view/home_page.dart';
import 'package:farm_flutter/view/phone_number_page.dart';
import 'package:farm_flutter/view/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool register_status = false;
  String regPhoneNo = "";
  _saveRegisterUserStatus()async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    // //Storing
    // sp.setBool("is_register_avl", true);

    register_status = sp.getBool("is_register_avl")?? false;
    regPhoneNo = sp.getString("regPhoneNo")?? "";

    print("is_register_avl is "+register_status.toString());
  }

  @override
  void initState() {

    _saveRegisterUserStatus();

    super.initState();
    Timer(
        Duration(seconds: 3),
            () {
              if(register_status == true){

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(phoneNo:regPhoneNo))
                );
              }
              else{
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PhoneNumberPage()
                    // RegistrationPage("09698012415")
                )
                );
              }
            }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/farm_logo.jpg'),
      ),
    );
  }
}