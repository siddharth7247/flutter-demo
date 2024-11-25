import 'package:hive/hive.dart';


part 'userModel.g.dart';
@HiveType(typeId: 0)
class User{
  @HiveField(0)
  final String userName;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  bool? isFaV;

  User({required this.userName, required this.email, required this.password, required this.isFaV});
  
}