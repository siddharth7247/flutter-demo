import 'package:hive/hive.dart';


part 'productModel.g.dart';

@HiveType(typeId: 0)
class Product{
  @HiveField(0)
  final String pName;

  @HiveField(1)
  final int pPrice ;

  @HiveField(2)
  bool isFav = false;

  Product({required this.pName, required this.pPrice});

}