import 'package:amazon/model/item_model.dart';

class Database {
  static List<ItemModel> itemList = [
    ItemModel(
      title: "Chair Name: 1",
      des: "Wodden chair 1",
      image: "assets/images/1.jpg",
      price: 27000,
    ),
    ItemModel(
      title: "Chair Name: 2",
      des: "Wodden chair 2",
      image: "assets/images/2.jpeg",
      price: 28000,
    ),
    ItemModel(
      title: "Chair Name: 3",
      des: "Wodden chair 3",
      image: "assets/images/3.jpg",
      price: 20000,
    ),
    ItemModel(
      title: "Chair Name: 4",
      des: "Wodden chair 4",
      image: "assets/images/4.jpeg",
      price: 31000,
    )
  ];
}
