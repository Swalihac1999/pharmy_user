import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is AddToCart) {
        try {
          final auth = FirebaseAuth.instance;
          final CollectionReference cartCollection =
              FirebaseFirestore.instance.collection('cart_collection');

          await cartCollection.add({
            'productId': event.productId,
            'userId': auth.currentUser!.uid,
            'qty': 1
          });
          emit(AddedToCart());
        } catch (e) {}
      } else {}
    });
  }
}
