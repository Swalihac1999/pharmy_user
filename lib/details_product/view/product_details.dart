// ignore_for_file: must_be_immutable, unused_field, prefer_const_constructors, avoid_dynamic_calls, prefer_int_literals, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phaarmy_user/details_product/view/booking.dart';
// import 'package:phaarmy_user/details_product/view/DetailsTile.dart';

// class ProductDetails extends StatefulWidget {
//   ProductDetails({super.key, required this.product});
//   var product;
//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   final FirebaseAuth _auth1 = FirebaseAuth.instance;

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product});
  QueryDocumentSnapshot<Object?> product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      child: Image.network(
                        product['image'].toString(),
                        height: 300,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0, bottom: 8.0),
                        child: Text(
                          product['product'].toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //     product['product'].toString(),
                      //     style: TextStyle(
                      //       fontSize: 35,
                      //       color: Colors.amber,
                      //       fontStyle: FontStyle.italic,
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product['price'].toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 83, 83, 81),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product['type'].toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 83, 83, 81),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const Divider(),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ''',
                        ),
                      ),

                      SizedBox(
                        height: 2,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) => BookingPage(
                                book: product,
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        elevation: 5.0,
                        minWidth: 200.0,
                        height: 35,
                        color: Color.fromARGB(255, 59, 108, 176),
                        child: new Text(
                          'Book now',
                          style: new TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      )

                      // Padding(
                      //   padding: const EdgeInsets.all(10),
                      //   child: Card(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(5)),
                      //     color: Color.fromARGB(255, 100, 97, 97),
                      //     child: Column(
                      //       children: [
                      //         ListTile(
                      //           leading: TextButton(
                      //             onPressed: () {},
                      //             child: Text(
                      //               'product quantity',
                      //               style: TextStyle(color: Colors.black),
                      //             ),
                      //           ),
                      //           trailing: TextButton(
                      //               onPressed: () {},
                      //               child: Text(
                      //                 'product quantity',
                      //                 style: TextStyle(color: Colors.black),
                      //               )),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                  // Row(

                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.black,
//             size: 20,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(
//               top: 20,
//             ),
//             child: Image.network(
//               product['image'].toString(),
//               fit: BoxFit.fitHeight,
//               height: 250,
//               width: 230,
//             ),
//           ),
//            Padding(
//               padding: const EdgeInsets.only(
//                 left: 46,
//                 // top: 5,
//               ),
//               child: Text(
//                 product['product'].toString(),
//                 style: GoogleFonts.actor(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
