class AuthRegisterResponse {
  int status;
  Data? data;
  String token;
  String message;   

  AuthRegisterResponse(
      {required this.status,
      required this.data,
      required this.token,
      required this.message});

  factory AuthRegisterResponse.fromJson(Map<String, dynamic> json) {
    return AuthRegisterResponse(
      status : json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      token : json['token'],
      message : json['message'],
    );
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String fullname;
  String otp;
  String adress;
  String phone;
  bool cgu;
  bool isSubscribe;

  Data(
  {required this.fullname,
  required this.otp,
  required this.adress,
  required this.phone,
  required this.cgu,
  required this.isSubscribe});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      fullname : json['fullname'],
    otp : json['otp'],
    adress : json['adress'],
    phone : json['phone'],
    cgu : json['cgu'],
    isSubscribe : json['isSubscribe'],
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['otp'] = this.otp;
    data['adress'] = this.adress;
    data['phone'] = this.phone;
    data['cgu'] = this.cgu;
    data['isSubscribe'] = this.isSubscribe;
    return data;
  }
}
