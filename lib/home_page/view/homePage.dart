// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_single_quotes, avoid_dynamic_calls

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phaarmy_user/categorise/categories.dart';
import 'package:phaarmy_user/details_product/product_details.dart';
// import 'package:get/route_manager.dart';
// import 'package:phaarmy/add_product/AddProduct.dart';
// import 'package:phaarmy/drawer/view/drawer.dart';
// import 'package:phaarmy/home_page/view/productDetails.dart';
import 'package:phaarmy_user/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference todoRef =
      FirebaseFirestore.instance.collection('product_form');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Widget appBarTitle = Text("Pharmy");
  Icon actionIcon = Icon(Icons.search);
  final imgList = [
    'https://cdn-icons-png.flaticon.com/512/6192/6192088.png',
    'https://cdn-icons-png.flaticon.com/512/6192/6192088.png',
    'https://cdn-icons-png.flaticon.com/512/6192/6192088.png',
    'https://cdn-icons-png.flaticon.com/512/6192/6192088.png',
  ];

  List<Widget> tabBarView(List<String> images) {
    List<Widget> _widget = [];

    for (int i = 0; i < images.length; i++) {
      _widget.add(Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(55),
         decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.lime,
            ),
        child: Column(
          children: [
            Image.network(images[i]),
            // Text('kkkkkkkk')
          ],
        )));
    }
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 59, 108, 176),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = Icon(Icons.close);
                  appBarTitle = TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                } else {
                  actionIcon = Icon(Icons.search);
                  appBarTitle = Text("Pharmy");
                }
              });
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 251, 251, 250),
      body: SafeArea(
        child: DefaultTabController(
          length: imgList.length,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Container(
                    child: Text(
                      'Basic Treatments',
                      style: TextStyle(
                          fontWeight: FontWeight.lerp(
                              FontWeight.w300, FontWeight.w900, 90,),
                          fontSize: 18,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelColor: Colors.black,
                      isScrollable: true,
                      // labelPadding: EdgeInsets.only(left: 30, right: 30),
                      unselectedLabelColor: Colors.grey,
                      // indicator: UnderlineTabIndicator(
                      //   borderSide: BorderSide(color: Colors.grey, width: 8.0),
                      //   insets: EdgeInsets.fromLTRB(
                      //     50.0,
                      //      0.0,
                      //     50.0,
                      //      40.0,
                      //    ),
                      // ),
                      tabs: [
                        Tab(text: "Fever"),
                        Tab(
                          text: 'headache',
                        ),
                        Tab(
                          text: 'cough',
                        ),
                        Tab(
                          text: 'Sore throat',
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(17),
                  width: double.maxFinite,
                  height: 300,
                  child: TabBarView(
                    children: tabBarView(imgList),
                  ),
                ),
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Container(
                    child: Text(
                      'Explore more',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: StreamBuilder(
                    stream: todoRef.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        print('-------------------------------');
                        print(snapshot.data!.docs);
                        final productItems = snapshot.data!.docs;
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 50,
                            mainAxisExtent: 250,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: productItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    product: productItems[index],
                                  ),
                                ),
                              ),
                              child: Card(
                                shadowColor: Colors.blueAccent,
                                child: ListTile(
                                  title: Image.network(
                                    productItems[index]['image'].toString(),
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        productItems[index]['product']
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        productItems[index]['price'].toString(),
                                      ),
                                      Text(
                                        productItems[index]['type'].toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color.fromARGB(255, 105, 230, 109),
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => Addproducts()));
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
