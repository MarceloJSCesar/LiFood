class User {
  final int id;
  final String name;
  final String token;
  final String email;
  final String password;

  const User({
    this.id,
    this.name,
    this.token,
    this.email,
    this.password,
  });

  @override
  String toString() =>
      'id: $id, name: $name, email: $email, token: $token, password: $password';
}
