import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitial()) {
    on<CollectionEvent>((event, emit) async {
      if (event is ProductAddEvent) {
        print("================");
        print(event.img.path);
        try {
          final auth = FirebaseAuth.instance;
          final formRef = FirebaseFirestore.instance.collection('product_form');

          final userId = auth.currentUser!.uid;
          final uuid = Uuid();
          final productId = uuid.v4();
          // XFile? image = await event.img;
          final refrence =
              FirebaseStorage.instance.ref().child('image').child(event.img.name);
          final file = File(event.img.path);
          await refrence.putFile(file);
          final imageLink = await refrence.getDownloadURL();
          await formRef.doc(productId).set({
            'image': imageLink,
            'price':event.price,
            'product': event.product,
            'type': event.type,
            'quantity': event.quantity,
            'brand': event.brand,
            'userId': auth.currentUser!.uid
          });
          emit(ProductAddSucces());
        } catch (e) {
          print('================================$e');
          emit(ProductAddFiled());
        }
      }
    });
  }
}
