import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terappmobile/models/request/auth_code_request.dart';
import 'package:terappmobile/models/request/authotp_request.dart';
import 'package:terappmobile/models/response/auth_code_response.dart';
import 'package:terappmobile/screens/auth/cgu.dart';
import 'package:terappmobile/screens/auth/otp.dart';
import 'package:terappmobile/screens/home/accueil.dart';
import 'package:terappmobile/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthMobileRequest? _authMobileRequest;
  AuthMobileResponse? _authMobileResponse;
  
  AuthMobileRequest? get authMobileRequest => _authMobileRequest;
  AuthMobileResponse? get authcoderesponse => _authMobileResponse;

  late bool _cgu;
  bool get cgu => _cgu;
  setCgu(bool value) {
    _cgu = value;
    notifyListeners();
  }

  /* -------------------     checkPhoneNumberProvider   -------------------*/
  Future<void> checkPhoneNumberProvider(
    AuthMobileRequest authMobileRequest,
    BuildContext context,
  ) async {
    final response = await AuthServices.checkPhoneNumber(authMobileRequest);
    try {
      _authMobileRequest = authMobileRequest;
      _authMobileResponse = response;
      if (response?.status == false) {
        print('user n exist pas');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Otp()),
        );
        notifyListeners();
      } else if (response?.status == true) {
        print('----- user exist -----');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Accueil()),
        );
        notifyListeners();
      }
    } catch (e) {
      throw Exception('fail check phone number:$e');
    }
  }

/* -------------------    validation otp code    -------------------*/
  Future validationOtpProvider(
      BuildContext context, AuthOtpRequest authOtpRequest) async {
    try {
      final response = await AuthServices.validationOtpService(authOtpRequest);
      //String token = response!.token!;
      /* Provider.of<AuthProvider>(context, listen: false)
          .setToken(token); */ // Update token using TokenProvider
      //print('token value $token');

      if (response!.status != null && response.status == true) {
        print(response.status);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cgu()),
        );
        return response;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("le code saisit est invalide"),
            backgroundColor: Colors.red,
          ),
        );
        print('erreur de verification VALIDATION');
      }
    } catch (e) {
      throw Exception('fail checking the otp code number:$e');
    }
  }
}
