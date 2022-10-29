class Signup {
  String? code = '';
  String? verbose = '';

  Signup({required this.code, required this.verbose});

  Signup.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    verbose = json['verbose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['verbose'] = this.verbose;
    return data;
  }
}
