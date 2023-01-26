// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:phaarmy/add_product/bloc/collection_bloc.dart';
// // import 'package:phaarmy/home_page/homePage.dart';
// import 'package:phaarmy_user/add_product/bloc/collection_bloc.dart';
// import 'package:phaarmy_user/home_page/homePage.dart';
// import 'package:uuid/uuid.dart';

// class Addproducts extends StatelessWidget {
//   Addproducts({super.key});
//   final auth = FirebaseAuth.instance;
  
//   late final XFile? img;

//   Future<XFile?> getImage() async {
//     final imagePicker = ImagePicker();
//     img = await imagePicker.pickImage(source: ImageSource.gallery);
//   }

//   late TextEditingController sellerNameController = TextEditingController();
//     late TextEditingController priceController = TextEditingController();

//   late TextEditingController emailController = TextEditingController();
//   late TextEditingController productnameController = TextEditingController();
//   late TextEditingController typeProductController = TextEditingController();
//   late TextEditingController quantityProductController =
//       TextEditingController();
//   late TextEditingController brandProductController = TextEditingController();

//   final users = FirebaseFirestore.instance.collection('users');
//  final collectionbloc = CollectionBloc(); 
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => collectionbloc,
//       child: BlocListener<CollectionBloc, CollectionState>(
//         listener: (context, state) {
//           if (state is ProductAddSucces) {
//              ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Sucessfully added'),
//               ),
//             );
//               Navigator.push(
//               context,
//               MaterialPageRoute<dynamic>(
//                 builder: (context) => HomePage(),
//               ),);
//           }
//           else{
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('faild added'),
//               ),
//             );
//           }
//         },
//         child: Scaffold(
//           body: Form(
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 TextFormField(
//                   controller: productnameController,
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       hintText: 'Product name',
//                       filled: true,
//                       fillColor: Colors.white),
//                 ),
//                 const SizedBox(
//                   height: 10,
                  
//                 ),
//                   TextFormField(
//                   controller: priceController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     hintText: 'price of product',
//                     // filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: typeProductController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     hintText: 'type of product',
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: quantityProductController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     hintText: 'quantity of product',
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: brandProductController,
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       hintText: 'brand of product',
//                       filled: true,
//                       fillColor: Colors.white),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextButton(onPressed: getImage, child: Text('upload pic')),
//                 MaterialButton(
//                   textColor: Colors.white,
//                   color: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text('add item'),
//                   onPressed: () {
// print('okkkkkk');

//                     collectionbloc.add(
//                       ProductAddEvent(
//                       product: productnameController.text,
//                       price: double.parse(priceController.text,),
//                       // name: sellerNameController.text,
//                       type: typeProductController.text,
//                       quantity: quantityProductController.text,
//                       brand: brandProductController.text,
//                       img: img!,
//                     ),);
//                     Navigator.pop(context);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   // Future<void>createForm({ required String name,
//   //   // required String email,
//   //   required String product,
//   //   required String type,
//   //   required String quantity,
//   //   required String brand,
//   //   required XFile? image,
//   //   })async{
//   //     final formRef = FirebaseFirestore.instance.collection('product_form') ;
//   //     final auth=FirebaseAuth.instance;
//   //     final uuid=Uuid();
//   //     final productId=uuid.v4();
//   //       final refrence =
//   //       FirebaseStorage.instance.ref().child('image').child(image!.name);
//   //        final file = File(image.path);
//   //   await refrence.putFile(file);
//   //   final imageLink = await refrence.getDownloadURL();
//   //    try {
//   //     await formRef.doc(productId).set({
//   //       'image': imageLink,
//   //       "product": product,
//   //       "name": name,
//   //       "type": type,
//   //       "quantity": quantity,
//   //       'brand': brand,
//   //       'userId': auth.currentUser!.uid
//   //     });
//   //   } catch (e) {
//   //     print('----------------------------$e');
//   //   }
//   //   }
// }
