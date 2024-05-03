class DataMobile {
  int? id;
  String? fullname;
  String? adress;
  String? phone;
  int? isSubscribe;
  int? cgu;

  DataMobile({
    required this.id,
    required this.fullname,
    required this.adress,
    required this.phone,
    required this.isSubscribe,
    required this.cgu,
  });

  DataMobile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    adress = json['adress'];
    phone = json['phone'];
    isSubscribe = json['isSubscribe'];
    cgu = json['cgu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['fullname'] = fullname;
    data['adress'] = adress;
    data['phone'] = phone;
    data['isSubscribe'] = isSubscribe;
    data['cgu'] = cgu;
    return data;
  }
}

class AuthMobileResponse {
  int? status;
  dynamic data; // Can be either a String or a Data object
  String? token;
  String? message;

  AuthMobileResponse({
    required this.status,
    required this.data,
    required this.token,
    required this.message,
  });

  factory AuthMobileResponse.fromJson(Map<String, dynamic> json) {
    final int? status = json['status'];
    final dynamic data = json['data'];

    // Check if data is a string or a map
    if (data is String) {
      // If data is a string, use it directly
      return AuthMobileResponse(
        status: status,
        data: data,
        token: json['token'],
        message: json['message'],
      );
    } else if (data is Map<String, dynamic>) {
      // If data is a map, parse it into a Data object
      return AuthMobileResponse(
        status: status,
        data: DataMobile.fromJson(data),
        token: json['token'],
        message: json['message'],
      );
    } else {
      throw Exception('Invalid data format');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data is DataMobile) {
      // If data is a Data object, convert it to JSON
      data['data'] = (this.data as DataMobile).toJson();
    } else {
      // If data is a string, use it directly
      data['data'] = this.data;
    }
    return {
      'status': this.status,
      'token': this.token,
      'message': this.message,
      ...data,
    };
  }
}
