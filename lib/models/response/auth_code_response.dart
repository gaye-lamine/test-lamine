class AuthMobileResponse {
  bool status;
  String data;
  String token;
  String message;

  AuthMobileResponse({required this.status,required  this.data, required this.token,required  this.message});

   factory AuthMobileResponse.fromJson(Map<String, dynamic> json) {

    return AuthMobileResponse(
      status : json['status'],
      data : json['data'],
      token : json['token'],
      message : json['message'],

    );
     
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}
