import 'dart:convert';
import 'dart:io';

import 'package:farm_flutter/Screens/Signup/sms_verification_page.dart';
import 'package:farm_flutter/utils/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:http/http.dart' as http;

// class SignUpForm extends StatelessWidget {
//   const SignUpForm({
//     Key? key,
//   }) : super(key: key);
//
//   getToken()async{
//
//     HttpClient client = new HttpClient(); //SSL Certificate အတွက်သုံးထားတာဖြစ်တယ်
//     client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
//
//     Map mapeddate ={
//       "username":"admin",
//       "password":"admin",
//       "grant_type":"password"
//     };
//
//     print(mapeddate);
//
//     final response = await http.post(
//       Uri.parse(eidHostIP+'token'),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded"
//       },
//       encoding: Encoding.getByName('utf-8'),
//       body: {
//         "username":"admin",
//         "password":"admin",
//         "grant_type":"password"
//       },
//     );
//
//     print("Response body : ${response.body}");
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//
//       print("Response body : ${response.body}");
//
//       Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(response.body));
//
//       print(data['access_token']);
//
//       setState(() {
//         myToken = data['access_token'];
//         if(myToken !=""){
//           resultStatus = true;
//           getTownship(data['access_token']);
//         }
//       });
//
//
//
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//     }
//
//     // String url ='https://192.168.4.135:443/token';
//     //
//     // Map map = {
//     //     "username":"admin",
//     //     "password":"admin",
//     //     "grant_type":"password"
//     // };
//     //
//     // HttpClientRequest request = await client.postUrl(Uri.parse(url));
//     //
//     // request.headers.set("content-type", "application/x-www-form-urlencoded");
//     //
//     // //request.headers.set(HttpHeaders.contentTypeHeader, "application/x-www_form-urlencoded");
//     // request.add(utf8.encode(json.encode(map)));
//     //
//     // HttpClientResponse response = await request.close();
//     //
//     // String reply = await response.transform(utf8.decoder).join();
//     //
//     // print(reply);
//     //
//     // // // final client = HttpClient() ;
//     //  final request = await client.postUrl(Uri.parse(url));
//     //  request.headers.set('content-type', 'application/json');
//     //  //request.followRedirects = true ;
//     //  //request.write(map);
//     //  request.add(utf8.encode(json.encode(map)));
//     //  final response = await request.close();
//     //  print("STATUS CODE = ${response.statusCode}");
//     //  print("Response headers = ${response.headers}");
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//             child: TextFormField(
//               textInputAction: TextInputAction.done,
//               obscureText: true,
//               cursorColor: kPrimaryColor,
//               decoration: InputDecoration(
//                 hintText: "Your Phone Number",
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(defaultPadding),
//                   child: Icon(Icons.phone),
//                 ),
//               ),
//             ),
//           ),
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             cursorColor: kPrimaryColor,
//             onSaved: (email) {},
//             decoration: InputDecoration(
//               hintText: "Your email",
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.person),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//           //   child: TextFormField(
//           //     textInputAction: TextInputAction.done,
//           //     obscureText: true,
//           //     cursorColor: kPrimaryColor,
//           //     decoration: InputDecoration(
//           //       hintText: "Your password",
//           //       prefixIcon: Padding(
//           //         padding: const EdgeInsets.all(defaultPadding),
//           //         child: Icon(Icons.lock),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           const SizedBox(height: defaultPadding / 2),
//           ElevatedButton(
//             onPressed: () async {
//
//               final String signature = await SmsAutoFill().getAppSignature;
//               print("Signature: $signature");
//
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>SmsVerificationPage()));
//             },
//             child: Text("Sign Up".toUpperCase()),
//           ),
//           const SizedBox(height: defaultPadding),
//           AlreadyHaveAnAccountCheck(
//             login: false,
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return LoginScreen();
//                   },
//                 ),
//               );
//
//
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  TextEditingController _phoneNumberController = TextEditingController();
   late String signature;

  sendOTPSMS(String phoneNumber)async{

    HttpClient client = new HttpClient(); //SSL Certificate အတွက်သုံးထားတာဖြစ်တယ်
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    // Map mapeddate ={
    //   "username":"admin",
    //   "password":"admin",
    //   "grant_type":"password"
    // };
    //
    // print(mapeddate);

    final body = {
      "to":phoneNumber,
      // "message":"1234 sfT1fyxlGmR",
      "message":"1234 "+signature,
      "sender":"SMSPoh"
    };

    final response = await http.post(
      Uri.parse(URLS.smsPoh),
      headers: {
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName('utf-8'),
      body: jsonEncode(body),
    );

    print("Response body : ${response.body}");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print("Response body : ${response.body}");



    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
    }

  }


  _getSignature() async{
    String signkey;

    signkey = await SmsAutoFill().getAppSignature;

    setState(() {
      signature = signkey;
    });
    print("Signature: $signature");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSignature();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              // obscureText: true,
              keyboardType: TextInputType.phone,
              cursorColor: kPrimaryColor,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: "Your Phone Number",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.phone),
                ),
              ),
            ),
          ),
          // TextFormField(
          //   keyboardType: TextInputType.emailAddress,
          //   textInputAction: TextInputAction.next,
          //   cursorColor: kPrimaryColor,
          //   onSaved: (email) {},
          //   decoration: InputDecoration(
          //     hintText: "Your email",
          //     prefixIcon: Padding(
          //       padding: const EdgeInsets.all(defaultPadding),
          //       child: Icon(Icons.person),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          //   child: TextFormField(
          //     textInputAction: TextInputAction.done,
          //     obscureText: true,
          //     cursorColor: kPrimaryColor,
          //     decoration: InputDecoration(
          //       hintText: "Your password",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.lock),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {

              final String signature = await SmsAutoFill().getAppSignature;
              print("Signature: $signature");
              sendOTPSMS(_phoneNumberController.text);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SmsVerificationPage()));
            },
            child: Text("Get OTP".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          // AlreadyHaveAnAccountCheck(
          //   login: false,
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return LoginScreen();
          //         },
          //       ),
          //     );
          //
          //
          //   },
          // ),
        ],
      ),
    );
  }
}
