import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


String token =  "wgpEdUEp3eb8mkzBOljXP71OenzlIeEm8NW2hDtV5FC9-sPyVb8cUYyWos6DXprW";

// final String apiEndpointNews = 'https://nnews.myanmarewg-ct.org/wp-json/wp/v2/posts?_embed';//https://mminfo.myanmarewg-ct.org/wp-json/wp/v2/posts?_embed
final String apiEndpointNews = 'https://mminfo.myanmarewg-ct.org/wp-json/wp/v2/posts?_embed';//https://mminfo.myanmarewg-ct.org/wp-json/wp/v2/posts?_embed


class URLS {

  //static const String domain = "mwdpay.mil.mm";
  // static const String domain = "http://192.168.4.91:82";//http://dsitdteam-001-site1.atempurl.com/
  static const String domain = "http://dsitdteam-001-site1.atempurl.com";

  // static const String orders = 'http://192.168.1.10:8090/api/orders';

  static const String smsPoh = "https://smspoh.com/api/v2/send";

  static const String check_user_URL =domain+'/api/User/check_user';
  static const String register_URL =domain+'/api/User/register';

}




class ApiService {

  static Future<String> CheckUser(body)async{
    print("This is CheckUser Method");
    print("body of CheckUser is "+body);

    http.Response r = await http.post(URLS.check_user_URL,headers: {"Content-Type": "application/json"},body: body);
    print("Status code CheckUser is "+r.statusCode.toString());
    print("r.body is "+r.body.toString());
    if(r.statusCode ==200){
      return r.body.toString();
    }
    else{
      return "Error";
    }
  }

  static Future<String> InsertUser(body)async{
//    String username = 'gisadminuser';
//    String password = 'admin!@#';
//
//    final credentials = '$username:$password';
//    final stringToBase64 = utf8.fuse(base64);
//    final encodedCredentials = stringToBase64.encode(credentials);
//
//    Map<String, String> headers = {
//      HttpHeaders.contentTypeHeader:"application/json",
//      HttpHeaders.authorizationHeader:"Basic $encodedCredentials",
//    };

    print("This is register Method");
    print("body of register is "+body);


//    http.Response r = await http.post('http://mwdpay.mil.mm/api/user/register',headers: {"Content-Type": "application/json"},body: body);
    http.Response r = await http.post(URLS.register_URL,headers: {"Content-Type": "application/json"},body: body);


    print("Status code register is "+r.statusCode.toString());
    print("r.body is "+r.body.toString());
    if(r.statusCode ==200){
      return r.body.toString();
    }
    else{
      return "Error";
    }
  }


}