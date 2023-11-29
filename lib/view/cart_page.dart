import 'package:amazon/controller/cart_screen_controller.dart';
import 'package:amazon/database/database.dart';
import 'package:amazon/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // var box = Hive.box('myBox');
  var box = Hive.box<ItemModel>("cartBox");
  var keylist = [];
  int count = 0;
  @override
  void initState() {
    keylist = box.keys.toList();
    print("cart list: $keylist");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          /*  Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), */
          Text(
            "My Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: keylist.length,
            itemBuilder: (context, index) {
              //   var item = box.get(keylist[index]);
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: keylist.length < 0
                    ? Center(child: Text("Add items in your cart"))
                    : ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              // child: Image.asset(
                              //   ImageConstant.chairList[index]["image_url"])
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          box.get(keylist[index])!.image),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              children: [
                                Text(
                                  box.get(keylist[index])!.title,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                Text(
                                  box.get(keylist[index])!.price.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      CartscreenController()
                                          .deleteQuanity(keylist[index]);
                                      keylist = box.keys.toList();
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                    )),

                                IconButton(
                                    onPressed: () {
                                      CartscreenController().incrementQuanity(
                                          keylist[index],
                                          box.get(keylist[index])! //notnull
                                          );
                                      //value--;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.add,
                                    )),
                                SizedBox(
                                  width: 2,
                                ),
                                box.get(keylist[index])!.quantity >= 1
                                    ? Text(
                                        box
                                            .get(keylist[index])!
                                            .quantity
                                            .toString(),
                                      )
                                    : Text(1.toString()), //////////
                                SizedBox(
                                  width: 2,
                                ),
                                IconButton(
                                    onPressed: () {
                                      CartscreenController().decrementQuanity(
                                          keylist[index],
                                          box.get(keylist[index])! //notnull
                                          );
                                      //value--;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
              );
            }),
      ),
    );
  }
}
