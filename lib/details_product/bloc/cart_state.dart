part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}


class AddedToCart extends CartState {}

