import 'package:farm_flutter/Screens/Signup/signup_screen.dart';
import 'package:farm_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:farm_flutter/feedui/first.dart';
import 'package:farm_flutter/feedui/fivth.dart';
import 'package:farm_flutter/feedui/fourth.dart';
import 'package:farm_flutter/feedui/second.dart';
import 'package:farm_flutter/feedui/sixth.dart';
import 'package:farm_flutter/feedui/third.dart';
import 'package:farm_flutter/view/about_page.dart';
import 'package:farm_flutter/view/member_page.dart';
import 'package:farm_flutter/view/news_page.dart';
import 'package:farm_flutter/view/profile_page.dart';
// import 'package:farm_flutter/view/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  String phoneNo;
  HomePage({required this.phoneNo});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _currentIndex = 0;

  final ScrollController scrollcontroller = new ScrollController();

  bool scroll_visibility = true;

  _saveRegisterUserStatus()async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    //Storing
    sp.setBool("is_register_avl", true);
    sp.setString("regPhoneNo",widget.phoneNo);

    bool result = sp.getBool("is_register_avl");

    print("is_register_avl is "+result.toString());
  }

  @override
  void initState() {
    // TODO: implement initState

    scrollcontroller.addListener(() {
      if(scrollcontroller.position.pixels > 0 || scrollcontroller.position.pixels < scrollcontroller.position.maxScrollExtent)
        scroll_visibility = false;
      else
        scroll_visibility = true;

      setState(() {});
    });

    _saveRegisterUserStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text("The Native",style: TextStyle(color: Colors.black),)),
          backgroundColor: Colors.white,
        ),
        body:
        // _currentIndex == 4 ? WelcomeScreen():
        _currentIndex == 0 ? NewsPage():_currentIndex == 1 ? ProfilePage() :_currentIndex == 2 ?MemberPage():AboutPage(),

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),

          /// More
          SalomonBottomBarItem(
            icon: Icon(Icons.group),
            title: Text("Member"),
            selectedColor: Colors.green,
          ),
          /// More
          SalomonBottomBarItem(
            icon: Icon(Icons.assignment),
            title: Text("About"),
            selectedColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
