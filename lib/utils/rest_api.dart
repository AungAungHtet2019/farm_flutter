import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


String token =  "wgpEdUEp3eb8mkzBOljXP71OenzlIeEm8NW2hDtV5FC9-sPyVb8cUYyWos6DXprW";

final String apiEndpointNews = 'https://nnews.myanmarewg-ct.org/wp-json/wp/v2/posts';

class URLS {

  //static const String domain = "mwdpay.mil.mm";
  //static const String domain = "10.111.128.252:2020";

  static const String orders = 'http://192.168.1.10:8090/api/orders';

  static const String smsPoh = "https://smspoh.com/api/v2/send";
}




class ApiService {

//   static Future<String> sendOTPMessage(body) async {
//     final response = await http.post(
//         URLS.SendSMS_URL, headers: {"Content-Type": "application/json"},
//         body: body);
//     http: //10.111.192.13:8080/api/sms/send
// //    if (response.body.toString() == "success"){
// //      print("hello in sendMessage is "+response.body.toString());
// //      return true;
// //    }
// //    else{
//     return response.body.toString();
//   }

}