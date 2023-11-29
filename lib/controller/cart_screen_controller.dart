import 'package:amazon/model/item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartscreenController {
  var box = Hive.box<ItemModel>("Box");
  incrementQuanity(var itemkey, ItemModel item) {
    num quantity = item.quantity;
    quantity++;
    print(quantity);
    box.put(
        itemkey,
        ItemModel(
            title: item.title,
            des: item.des,
            image: item.image,
            price: item.price));
  }

  decrementQuanity(var itemkey, ItemModel item) {
    num quantity = item.quantity;
    quantity--;
    print(quantity);
    box.put(
        itemkey,
        ItemModel(
            title: item.title,
            des: item.des,
            image: item.image,
            price: item.price));
  }

  deleteQuanity(int itemkey) {
    box.delete(itemkey);
  }
}
