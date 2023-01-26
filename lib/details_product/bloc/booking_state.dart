part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}
class BookingAddSucess extends BookingState {}

class BookingAddFiled extends BookingState {
  BookingAddFiled();
}