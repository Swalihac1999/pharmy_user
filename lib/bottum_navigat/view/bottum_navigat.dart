// // ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const

// import 'package:flutter/material.dart';
// // import 'package:phaarmy/add_product/addProduct.dart';
// // import 'package:phaarmy/drawer/view/drawer.dart';
// // import 'package:phaarmy/home_page/homePage.dart';
// import 'package:phaarmy_user/add_product/addProduct.dart';
// import 'package:phaarmy_user/home_page/homePage.dart';
// import 'package:phaarmy_user/medicine_search/view/medicine.dart';

// class Dashbord extends StatefulWidget {
//   const Dashbord({super.key});

//   @override
//   State<Dashbord> createState() => _DashbordState();
// }

// class _DashbordState extends State<Dashbord> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // ignore: prefer_final_fields
//   List<Widget> _widgets = [
//      HomePage(),
//      MedicineSearch()

//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  floatingActionButton:FloatingActionButton(
//       //   backgroundColor:  Color.fromARGB(255, 105, 230, 109) ,
//       //     onPressed: (){
//       //    Navigator.push(
//       //       context, MaterialPageRoute(builder: (context) => Addproducts(),),);
//       //     },
//       //     child: Icon(Icons.add,color: Colors.white,), //icon inside button
//       // ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

//       body: _widgets.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: 'Home',
//               backgroundColor: Color.fromARGB(115, 121, 118, 118)),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.category),
//           //   label: 'category',
//           // ),
//           // ignore: prefer_const_constructors
//           BottomNavigationBarItem(
//             icon: Icon(Icons.medical_services),
//             label: 'medicine',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.account_box),
//           //   label: 'Account',
//           // ),
//           // BottomNavigationBarItem(

//           //   icon: Icon(Icons.person),
//           //   label: 'Profile',
//           // ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor:  Color.fromARGB(255, 105, 230, 109),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_single_quotes

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phaarmy_user/map_page/view/mapPage.dart';
import 'package:phaarmy_user/drawer/view/drawer.dart';
import 'package:phaarmy_user/home_page/homePage.dart';
import 'package:phaarmy_user/order_page/view/order.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;

  void _onltemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _widgets = [
    HomePage(),
    BookingView(),
    MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 108, 176),
      body: _widgets.elementAt(_selectedindex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 59, 108, 176),
        animationDuration: const Duration(microseconds: 300),
        height: 60,
        items: const [
          Icon(
            FontAwesomeIcons.house,
            color: Colors.white,
          ),
          Icon(
            Icons.medical_services_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ],
        index: _selectedindex,
        onTap: _onltemTapped,
      ),
    );
  }

  // Text appBarText() {
  //   switch (_selectedindex) {
  //     case 0:
  //       return Text('Electric');
  //     case 1:
  //       return Text('Favourite');
  //     case 2:
  //       return Text('Used cars');

  //     default:
  //       return Text('Cars');
  //   }
  // }
}
