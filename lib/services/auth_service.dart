import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:terappmobile/configs/config.dart';
import 'package:terappmobile/models/request/auth_code_request.dart';
import 'package:terappmobile/models/request/auth_register_request.dart';
import 'package:terappmobile/models/request/authotp_request.dart';
import 'package:terappmobile/models/response/auth_code_response.dart';
import 'package:terappmobile/models/response/auth_register_response.dart';
import 'package:terappmobile/models/response/authotp_response.dart';
class AuthServices {
  /* ------------------- AuthService  -------------------*/
  static var client = http.Client(); /* login service */


  /* ------------------- check the phone   -------------------*/
  static Future<AuthMobileResponse?> checkPhoneNumber(AuthMobileRequest authMobileRequest) async {
    try {
      final response =
      await http.post(Uri.parse(Config.apiUrl + Config.authMobileApi),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Accept': '*/*'
      },
      body: jsonEncode(authMobileRequest));
      print("${response.body.toString()}");
      // Parse the response body and convert it to AuthMobileResponse
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final AuthMobileResponse authResponse =
          AuthMobileResponse.fromJson(jsonResponse);
      return authResponse;
    } catch (e) {
      throw Exception('fail the otp code:$e');
    }
  } 

    /* --------------   validation otp code  -----------------*/
    static Future<AuthOtpResponse?> validationOtpService(
      AuthOtpRequest model) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      var url = Uri.parse(Config.apiUrl + Config.authValidationCodeApi);
      var response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model));
      print('response otp code   ${response.body.toString()}');
     // if(response.statusCode == 400 || response.statusCode == 422 ){
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        AuthOtpResponse authOtpResponse =
            AuthOtpResponse.fromJson(jsonResponse);
        return authOtpResponse; 

     // }
      
    } catch (e) {
      throw Exception('fail to log user :$e');
    }
  }
  /* --------------   register otp  -----------------*/
  static Future<AuthRegisterResponse?> registerService(
      AuthRegisterRequest model) async {
    try {
      Map<String, String> requestHeaders = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      var url = Uri.parse(Config.apiUrl + Config.authRegisterApi);
      var response = await client.post(url,
          headers: requestHeaders, body: jsonEncode(model));
      print('response register code   ${response.body.toString()}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      AuthRegisterResponse authRegisterResponse = AuthRegisterResponse.fromJson(jsonResponse);
      return authRegisterResponse;


    } catch (e) {
      throw Exception('fail to log user :$e');
    }
  }





}
