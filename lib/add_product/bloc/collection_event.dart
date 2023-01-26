part of 'collection_bloc.dart';

@immutable
abstract class CollectionEvent {}

class ProductAddEvent extends CollectionEvent {
  ProductAddEvent(
      {required this.product,
      required this.price,
      required this.type,
      required this.quantity,
      required this.brand,
      required this.img});

 final  XFile img;
  final double price;
  final String product;
  final String type;
  final String quantity;
  final String brand;
}
