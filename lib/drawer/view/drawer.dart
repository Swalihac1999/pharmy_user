// // ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'package:flutter/material.dart';

// class DrawerPage extends StatelessWidget {
//   const DrawerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(

// ignore_for_file: prefer_const_constructors

//       child: ListView(
//         padding: EdgeInsets.zero,
//         // ignore: prefer_const_literals_to_create_immutables
//         children: [
//           UserAccountsDrawerHeader(
//               accountName: Text('SWALIH'),
//               accountEmail: Text('Swalihac1999@gamil.com'),
//               currentAccountPicture: CircleAvatar(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                   child: Image.network(
//                     'https://e7.pngegg.com/pngimages/647/460/png-clipart-computer-icons-open-person-family-icon-black-silhouette-black.png',width: 70,
//                     height: 50,
//                   ),
//                 ),
//                 backgroundColor: Colors.white38,
//               ),
//               decoration: BoxDecoration(color: Color.fromARGB(97, 89, 87, 87))),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text('Home'),
//             onTap: () {},
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('My Account'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.shopping_bag),
//             title: Text('Oders'),
//             onTap: () {},
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.category),
//             title: Text('Category'),
//             onTap: () {},
//           ),
//           Divider(
//             thickness: 2,
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Setteings'),
//             onTap: () {},
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.help),
//             title: Text('Help'),
//             onTap: () {},
//           ),
//           Divider(
//             thickness: 2,
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Logout', style: TextStyle(color: Colors.red)),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Drawerpage extends StatelessWidget {
  Drawerpage({super.key});
  final users = FirebaseFirestore.instance.collection('register_collection');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Drawer(
      child: StreamBuilder(
          stream: users.doc(auth.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 250,
                    child: UserAccountsDrawerHeader(
                      accountName: Text(
                        userData['second name'].toString(),
                        style: GoogleFonts.adamina(
                          fontSize: 14,
                        ),
                      ),
                      accountEmail: Text(
                        userData['email'].toString(),
                        style: GoogleFonts.adamina(
                          fontSize: 14,
                        ),
                      ),
                      currentAccountPictureSize: const Size.square(100),
                      currentAccountPicture: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: getImage,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: (userData['profileImage'] == '')
                                ? Text(
                                    // ignore: avoid_dynamic_calls
                                    userData['second name'][0]
                                        .toString()
                                        .toUpperCase(),
                                    style: GoogleFonts.alegreyaSansSc(
                                      fontSize: 40,
                                      color: Colors.blue,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : ClipOval(
                                    child: Image.network(
                                      userData['profileImage'].toString(),
                                      fit: BoxFit.cover,
                                      width: 90,
                                      height: 120,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    
                  ),
                    ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Account'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Oders'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category'),
            onTap: () {},
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setteings'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {},
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout', style: TextStyle(color: Colors.red)),
          )
                ],
              );
            }
            else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          },),
    );
  }
  Future<void> getImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _imagePicker = ImagePicker();

    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      await updateProfile(image!);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProfile(XFile image) async {
    final reference =
        FirebaseStorage.instance.ref().child('ProfileImage').child(image.name);
    final file = File(image.path);
    await reference.putFile(file);
    final imageLink = await reference.getDownloadURL();

    await users.doc(auth.currentUser!.uid).update({'profileImage': imageLink});
    // ignore: avoid_print
    print(imageLink);
  }
}


