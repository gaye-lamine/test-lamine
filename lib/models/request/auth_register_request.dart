class AuthRegisterRequest {
  String fullname;
  String otp;
  String adress;
  String phone;
  bool cgu;
  bool isSubscribe;

  AuthRegisterRequest(
      {required this.fullname,
      required this.otp,
      required this.adress,
      required this.phone,
      required this.cgu,
      required this.isSubscribe});

  factory AuthRegisterRequest.fromJson(Map<String, dynamic> json) {
    return
    AuthRegisterRequest(
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
