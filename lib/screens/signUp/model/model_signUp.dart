class User {
  String? email;
  String? password;
  String? phone;
  User({this.email, this.password, this.phone});
  @override
  String toString() {
    return 'User{email: $email, password: $password, phone: $phone}';
  }
}