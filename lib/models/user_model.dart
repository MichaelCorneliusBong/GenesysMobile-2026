class UserModel {
  final String name;
  final String email;
  final bool isLoggedIn;

  const UserModel({
    required this.name,
    required this.email,
    this.isLoggedIn = true,
  });
}
