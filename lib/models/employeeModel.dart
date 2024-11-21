import 'dart:convert';

class Employee {
    final int? id;
    final String name;
    final String email;
    final String address;
    final int phoneNo;
    

    Employee({
        required this.id,
        required this.name,
        required this.email,
        required this.address,
        required this.phoneNo,
        
    });

    factory Employee.fromRawJson(String str) => Employee.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phoneNo: json["phoneNo"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "phoneNo": phoneNo,
       
    };
}
