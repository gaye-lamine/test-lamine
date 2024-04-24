class AuthMobileRequest {
  AuthMobileRequest({
    required this.phoneNumber,
  });

  String? phoneNumber;

  factory AuthMobileRequest.fromJson(Map<String, dynamic> json) {
    return AuthMobileRequest(
      phoneNumber: json["phone_number"],
    );
  }

  Map<String, dynamic> toJson() => {
    "phone_number": phoneNumber,
    };
}
