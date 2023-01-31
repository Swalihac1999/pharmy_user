part of 'cartproducts_bloc.dart';

@immutable
abstract class CartproductsState {}

class CartproductsInitial extends CartproductsState {}

class LoadedProducts extends CartproductsState {
  LoadedProducts({required this.cartData});


List<DocumentSnapshot<Map<String, dynamic>>> cartData;
}
