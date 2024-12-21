class LoginModel {
  final String? email;
  final String password;
  final String? cashierCode;
  LoginModel({ this.email,  required this.password , this.cashierCode});

  @override
  String toString() {
    return cashierCode == null ? 'LoginModel{email: $email, password: $password,}' : 'LoginModel{email: $email, cashierCode: $cashierCode,}';
  }
}