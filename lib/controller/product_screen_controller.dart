import 'dart:js';

import 'package:amazon/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductScreenController {
  var box = Hive.box<ItemModel>("cartBox");
  addtocart(ItemModel product, BuildContext context) async {
    box.add(product);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("data added")));
  }
}
