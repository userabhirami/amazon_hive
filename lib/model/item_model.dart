import 'package:hive_flutter/hive_flutter.dart';
part 'item_model.g.dart';

// .g file varan vendi terminal il dart run build_runner build click cheyyuka
// ennitte terminal il ninne part 'item_model.g.dart'; paste cheyyuka
//veendum run cheyyanam same line(dart run build_runner build)
@HiveType(typeId: 1)
class ItemModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String des;
  @HiveField(2)
  String image;
  @HiveField(3)
  num price;
  @HiveField(4)
  bool isCarted;
  @HiveField(5)
  num productId;
  @HiveField(6)
  num quantity;
  ItemModel({
    required this.title,
    required this.des,
    required this.image,
    required this.price,
    this.isCarted = false,
    this.productId = 0,
    this.quantity = 0,
  });
}
