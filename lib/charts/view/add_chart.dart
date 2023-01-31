import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phaarmy_user/charts/bloc/cartproducts_bloc.dart';
import 'package:phaarmy_user/charts/view/cartcard.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final _cartBloc = CartproductsBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cartBloc..add(GetCartData()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: BlocBuilder<CartproductsBloc, CartproductsState>(
              builder: (context, state) {
               if (state is LoadedProducts) {
                 return ListView.builder(
                  itemCount: state.cartData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cartCard(
                      
                    );
                  },
                );
                 
               } else {
                return CircularProgressIndicator();
                 
               }
              },
            ),
          ),
        ),
      ),
    );
  }
}
