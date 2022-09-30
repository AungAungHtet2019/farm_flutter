
import 'package:farm_flutter/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int counter = 0;
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
    // TODO: implement initState
    super.initState();
    _saveRegisterUserStatus();
    Provider.of<UserProvider>(context,listen: false).checkUser(regPhoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:5,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // colors: [Colors.deepPurple,Colors.deepPurpleAccent],
                      colors: [Colors.green,Colors.lightGreenAccent],
                    ),
                  ),
                  child: Column(
                      children: [
                        SizedBox(height: 110.0,),
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage: AssetImage('assets/images/farmer_profile.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                            // 'ဦးမြင့်ကြိုင်',
                          Provider.of<UserProvider>(context,listen: true).userModel.UserName,
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 20.0,
                            )),
                        SizedBox(height: 5.0,),
                        // Text('S Class Mage',
                        //   style: TextStyle(
                        //     color:Colors.white,
                        //     fontSize: 15.0,
                        //   ),)
                      ]
                  ),
                ),
              ),

              Expanded(
                flex:5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child:Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Card(
                            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                            child: Container(
                                width: 310.0,
                                height:290.0,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Information",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w800,
                                        ),),
                                      Divider(color: Colors.grey[300],),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.home,
                                            color: Colors.blueAccent[400],
                                            size: 35,
                                          ),
                                          SizedBox(width: 20.0,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Category",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),),
                                              Text("Agriculture, Farming",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey[400],
                                                ),)
                                            ],
                                          )

                                        ],
                                      ),
                                      // SizedBox(height: 20.0,),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   children: [
                                      //     Icon(
                                      //       Icons.auto_awesome,
                                      //       color: Colors.yellowAccent[400],
                                      //       size: 35,
                                      //     ),
                                      //     SizedBox(width: 20.0,),
                                      //     Column(
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text("Magic",
                                      //           style: TextStyle(
                                      //             fontSize: 15.0,
                                      //           ),),
                                      //         Text("Spatial & Sword Magic, Telekinesis",
                                      //           style: TextStyle(
                                      //             fontSize: 12.0,
                                      //             color: Colors.grey[400],
                                      //           ),)
                                      //       ],
                                      //     )
                                      //
                                      //   ],
                                      // ),
                                      // SizedBox(height: 20.0,),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   children: [
                                      //     Icon(
                                      //       Icons.favorite,
                                      //       color: Colors.pinkAccent[400],
                                      //       size: 35,
                                      //     ),
                                      //     SizedBox(width: 20.0,),
                                      //     Column(
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text("Loves",
                                      //           style: TextStyle(
                                      //             fontSize: 15.0,
                                      //           ),),
                                      //         Text("Eating cakes",
                                      //           style: TextStyle(
                                      //             fontSize: 12.0,
                                      //             color: Colors.grey[400],
                                      //           ),)
                                      //       ],
                                      //     )
                                      //
                                      //   ],
                                      // ),
                                      SizedBox(height: 20.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.people,
                                            color: Colors.lightGreen[400],
                                            size: 35,
                                          ),
                                          SizedBox(width: 20.0,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Team",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),),
                                              Text("Team Agriculture",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey[400],
                                                ),)
                                            ],
                                          )

                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            )
                        ),
                      )
                  ),
                ),
              ),

            ],
          ),
          Positioned(
              top:MediaQuery.of(context).size.height*0.45,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                    padding:EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child:Column(
                              children: [
                                Text('Battles',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.0
                                  ),),
                                SizedBox(height: 5.0,),
                                Text("$counter",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),)
                              ],
                            )
                        ),

                        Container(
                          child: Column(
                              children: [
                                Text(
                                  'Birthday',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.0
                                  ),),
                                SizedBox(height: 5.0,),
                                Text(
                                  // 'April 7th',
                                  Provider.of<UserProvider>(context,listen: true).userModel.DateOfBirth,

                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),)
                              ]),
                        ),

                        Container(
                            child:Column(
                              children: [
                                Text('Age',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14.0
                                  ),),
                                SizedBox(height: 5.0,),
                                Text('39 yrs',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),)
                              ],
                            )
                        ),
                      ],
                    ),
                  )
              )
          )
        ],

      ),
    );
  }
}
