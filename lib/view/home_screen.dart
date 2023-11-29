import 'package:amazon/database/database.dart';
import 'package:amazon/model/item_model.dart';
import 'package:amazon/utils/image_constant.dart';
import 'package:amazon/view/cart_page.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<ItemModel>("Box");
  bool isFavourite = false;
  var favouritelist = [];
  Color iconColor = Colors.grey;
  @override
  void initState() {
    favouritelist = box.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //  Icon(Icons.arrow_back, color: Colors.black),
              Text(
                "Decoration",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),

              InkWell(
                onTap: () {
                  /*   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  ); */
                },
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(ImageConstant.cart),
                ),
              )
            ],
          ),
          bottom: TabBar(isScrollable: true, tabs: [
            Text(
              "Featured",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Collection",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Trench",
              style: TextStyle(color: Colors.black),
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(Database.itemList[index].image),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        onPressed: () {
                          setState(() {
                            box.put(
                                favouritelist[index],
                                ItemModel(
                                    title: favouritelist[index]!.title,
                                    des: favouritelist[index]!.des,
                                    image: favouritelist[index]!.image,
                                    price: favouritelist[index]!.price));
                          });

                          favouritelist = box.keys.toList(); // get keys from db
                          print("favourite list: $favouritelist");
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  Database.itemList[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  Database.itemList[index].price.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
