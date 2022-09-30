import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cipher2/cipher2.dart';
import 'package:farm_flutter/Screens/Signup/sms_verification_page.dart';
import 'package:farm_flutter/model/user_model.dart';
import 'package:farm_flutter/provider/user_provider.dart';
import 'package:farm_flutter/utils/dialogue.dart';
import 'package:farm_flutter/utils/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../constants.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  TextEditingController _phoneNumberController = TextEditingController();
  late String signature;
  late String randomnum;

  sendOTPSMS(String phoneNumber)async{

    HttpClient client = new HttpClient(); //SSL Certificate အတွက်သုံးထားတာဖြစ်တယ်
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    int min = 1000; //min and max values act as your 6 digit range
    int max = 9999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    setState(() {
      randomnum = rNum.toString();
    });
    print(randomnum);

    final body = {
      "to":phoneNumber,
      // "message":"1234 sfT1fyxlGmR",
      "message":"Your OTP Code is "+randomnum+" "+signature,
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

  _checkUser(String phoneNo)async{


    String finalPlainText = phoneNo;
    String key = '7532145698754125';
    String iv = '8521365478963215';
    String aesEncryptedData = await Cipher2.encryptAesCbc128Padding7(finalPlainText, key, iv);
    print(" _myEncryptData is "+aesEncryptedData);
    Map body={
      "Data":"$aesEncryptedData"
    };
    var jsonbody = json.encode(body);
    await ApiService.CheckUser(jsonbody).then((success) {
      print("++++++++++++++++++++++++"+success.toString());
      // Map<String, dynamic> jsonData = json.decode(success) as Map<String, dynamic>;
      print("***********************");
      // print("-------"+jsonData.toString());
      if(success.toString() == "NoOK")
      {
        Navigator.pop(context);
        sendOTPSMS(_phoneNumberController.text);
        // Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SmsVerificationPage(_phoneNumberController.text,randomnum,signature)));
      }
      else{
        Navigator.pop(context);
        // Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(phoneNo: _phoneNumberController.text)), (route) => false);

      }

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSignature();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                // padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                padding: EdgeInsets.only(left: 30,right: 30),
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
              const SizedBox(height: defaultPadding / 2),
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: ElevatedButton(
                  onPressed: ()  async{

                    // check data using text input value
                    // open loading dialog while network call
                    // close loading dialog
                    Dialogs.showLoadingDialog(context, _keyLoader);
                    try{
                      await Provider.of<UserProvider>(context,listen: false).checkUser(_phoneNumberController.text);
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(phoneNo:_phoneNumberController.text)), (route) => false);
                    }
                    catch(exp){
                      print("exp");
                      print(exp);
                      Navigator.pop(context);
                      sendOTPSMS(_phoneNumberController.text);
                      // Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SmsVerificationPage(_phoneNumberController.text,randomnum,signature)));
                    }



                  },
                  child: Text("Get OTP".toUpperCase()),
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );

  }
}
