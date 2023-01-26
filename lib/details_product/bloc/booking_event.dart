part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}
class BookingAddEvent extends BookingEvent {
  BookingAddEvent(
      {
    required this.name,
    required this.place,
    required this.number,
    required this.productName,
    required this.price,
    required this.fund,
    required this.image,
      });

  String name;
  String place;
  String number;
  String productName;
  String price;
   String fund;
  String image;
}
