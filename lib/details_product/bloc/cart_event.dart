part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCart extends CartEvent{
  AddToCart({required this.productId});
  String productId;
}
