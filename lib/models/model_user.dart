class UserModel {
  int id;
  String name;
  String surname;
  String fullName;
  String userName;
  bool isActive;
  List<dynamic> roleNames;
  String comments;
  List favorites;
  List appointments;
  bool isLoggedIn = false;

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      surname: json["surname"],
      fullName: json["fullName"],
      userName: json["userName"],
      isActive: json["isActive"],
      roleNames: json["roleNames"],
      comments: json["comments"],
      favorites: json["favorites"],
      appointments: json["appoinments"],
    );
  }

  UserModel({
    this.id,
    this.name,
    this.surname,
    this.fullName,
    this.userName,
    this.isActive,
    this.roleNames,
    this.comments,
    this.favorites,
    this.appointments,
    this.isLoggedIn,
  });
}
