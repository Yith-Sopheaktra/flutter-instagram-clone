class UserModel {
  int id;
  String name;
  String email;
  String password;
  String image;
  String tel;

  UserModel({
    required this.id,
    this.name = "No-Name",
    this.email = "No-Email",
    this.password = "No-Password",
    this.image = "No-Image",
    this.tel = "No-tel",
  });

}
