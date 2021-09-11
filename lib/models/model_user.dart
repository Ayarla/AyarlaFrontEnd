class UserModel {
  String userName;
  String name;
  String surname;
  String emailAddress;
  bool isActive;
  String fullName;
  String lastLoginTime;
  String creationTime;
  List<dynamic> roleNames;
  String password;
  String comments;
  List favorites;
  List appointments;
  int id;

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      surname: json["surname"],
      isActive: json["isActive"],
      fullName: json["fullName"],
      roleNames: json["roleNames"],
      comments: json["comments"],
      favorites: json["favorites"],
      appointments: json["appoinments"],
      userName: json["userName"],
      // emailAddress: json["emailAddress"],
      // lastLoginTime: json["lastLoginTime"],
      // creationTime: json["creationTime"],
      // password: json["password"],
    );
  }

  UserModel({
    this.userName,
    this.name,
    this.id,
    this.password,
    this.appointments,
    this.comments,
    this.creationTime,
    this.emailAddress,
    this.favorites,
    this.fullName,
    this.isActive,
    this.lastLoginTime,
    this.roleNames,
    this.surname,
  });
}
