// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({super.key});
  final category = [
    {
      'category': 'Men',
      'image': 'https://i.pinimg.com/originals/0c/7f/91/0c7f91d5552ee4b454636538b692e673.jpg',
    },
    {
      'category': 'Women',
      'image': 'https://sewguide.com/wp-content/uploads/2018/11/fashion-style144.jpg',
    },
    {
      'category': 'Watch',
      'image': 'https://cdn-icons-png.flaticon.com/512/306/306836.png',
    },
    {
      'category': 'Specks',
      'image': 'https://freepngdownload.com/image/thumb/clipart-specks.png',
    },
    {
      'category': 'Bag',
      'image': 'https://imgshopimages.lbb.in/catalog/product/d/a/dailyobjects-natural-cream-and-black-trapeze-crossbody-bag.png.jpg',
    },
     {
      'category': 'Make UP',
      'image': 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1639693954-screen-shot-2021-12-16-at-5-31-39-pm-1639693942.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  category[index].values.last,
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(child: Text(category[index].values.first))
            ],
          ),
          
          );
        },);
  }
}
