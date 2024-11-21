class Student {
  String? name;
  String? surname;
  String? email;
  String? password;

  Student({this.name, this.surname, this.email, this.password});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}