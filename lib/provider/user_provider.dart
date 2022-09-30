import 'dart:convert';

import 'package:cipher2/cipher2.dart';
import 'package:farm_flutter/model/user_model.dart';
import 'package:farm_flutter/utils/global.dart';
import 'package:farm_flutter/utils/rest_api.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  UserModel userModel  = UserModel(
      ID: 0,
      UserID: "UserID",
      UserName: "UserName",
      PhoneNumber: "PhoneNumber",
      DateOfBirth: "DateOfBirth",
      LoginAllow: false,
      LockDisableBy: "LockDisableBy",
      LockDisableDate: "LockDisableDate",
      LockEnableBy: "LockEnableBy",
      CreatedBy: "CreatedBy",
      CreatedDate: "CreatedDate",
      ModifiedBy: "ModifiedBy",
      ModifiedDate: "ModifiedDate",
      Active: false,
      ActiveDisableBy: "ActiveDisableBy",
      ActiveDisableDate: "ActiveDisableDate",
      ActiveEnableBy: "ActiveEnableBy",
      ActiveEnableDate: "ActiveEnableDate"
  );
  //List<UserModel> userData = [];
  //bool checkUserDataLoading = false;

  /*
    @input -> phoneNO

    @output ->
    UserModel / No Data Exception
   */
  Future<UserModel> checkUser(String phoneNo)async{

    //checkUserDataLoading = true;
    //notifyListeners();

    String finalPlainText = phoneNo;
    String aesEncryptedData = await Cipher2.encryptAesCbc128Padding7(finalPlainText, key, iv);
    print(" _myEncryptData is "+aesEncryptedData);
    Map body={
      "Data":"$aesEncryptedData"
    };
    var jsonbody = json.encode(body);
    return await ApiService.CheckUser(jsonbody).then((success) {
      print("++++++++++++++++++++++++"+success.toString());
      print("***********************");
      // print("-------"+jsonData.toString());

      //checkUserDataLoading = false;
      //notifyListeners();

      if(success.toString() == "NoOK")
      {
        throw Exception("NoOK");
      }
      else{
        UserModel userObjectInJson = UserModel.fromJson(json.decode(success.toString()));
        userModel = userObjectInJson;
        notifyListeners();
        return userObjectInJson;
      }
    });
  }

}