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
      userName: json["userName"],
      name: json["name"],
      surname: json["surname"],
      // emailAddress: json["emailAddress"],
      isActive: json["isActive"],
      fullName: json["fullName"],
      // lastLoginTime: json["lastLoginTime"],
      // creationTime: json["creationTime"],
      roleNames: json["roleNames"],
      // password: json["password"],
      comments: json["comments"],
      favorites: json["favorites"],
      appointments: json["appoinments"],
      id: json["id"],
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
