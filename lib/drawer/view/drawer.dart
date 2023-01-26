// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('SWALIH'),
              accountEmail: Text('Swalihac1999@gamil.com'),
              currentAccountPicture: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Image.network(
                    'https://e7.pngegg.com/pngimages/647/460/png-clipart-computer-icons-open-person-family-icon-black-silhouette-black.png',width: 70,
                    height: 50,
                  ),
                ),
                backgroundColor: Colors.white38,
              ),
              decoration: BoxDecoration(color: Color.fromARGB(97, 89, 87, 87))),
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
      ),
    );
  }
}
