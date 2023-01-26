
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is BookingAddEvent) {
        try {
          final auth = FirebaseAuth.instance;
          var uuid = const Uuid();
          var bookingId = uuid.v4();
          final booking =
              FirebaseFirestore.instance.collection('booking_collection');
          final userId = auth.currentUser!.uid;
          await booking.doc(bookingId).set({
            'product': event.productName,
            'price': event.price,
            'fund': '',
            'image': event.image,
            'name': event.name,
            'place': event.place,
            'contact_number': event.number,
            'booking_id': bookingId,
            'user_id': userId,
          });
          emit(BookingAddSucess());
        } catch (e) {
          emit(BookingAddFiled());
        }
      }
    });
  }
}
