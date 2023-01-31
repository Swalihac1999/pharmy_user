import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'cartproducts_event.dart';
part 'cartproducts_state.dart';

class CartproductsBloc extends Bloc<CartproductsEvent, CartproductsState> {
  CartproductsBloc() : super(CartproductsInitial()) {
    on<CartproductsEvent>((event, emit) async {
      if (event is GetCartData) {
        final auth = FirebaseAuth.instance;
        final ref = await FirebaseFirestore.instance
            .collection('cart_collection')
            .where('userId', isEqualTo: auth.currentUser!.uid)
            .get();

        final cartProducts = <DocumentSnapshot<Map<String, dynamic>>>[];

        for (final element in ref.docs) {
          final cartData = await FirebaseFirestore.instance
              .collection('product_form')
              .doc(element['productId'].toString())
              .get();
          cartProducts.add(cartData);
        }
        emit(LoadedProducts(cartData: cartProducts));
      }
    });
  }
}
