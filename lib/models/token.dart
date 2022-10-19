class Token {
  String? customerType;
  bool? authenticated;
  String? firstName;
  String? lastName;
  String? email;
  String? token;

  Token(
      {this.customerType,
      this.authenticated,
      this.firstName,
      this.lastName,
      this.email,
      this.token});

  Token.fromJson(Map<String, dynamic> json) {
    customerType = json['customer_type'];
    authenticated = json['authenticated'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_type'] = this.customerType;
    data['authenticated'] = this.authenticated;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
