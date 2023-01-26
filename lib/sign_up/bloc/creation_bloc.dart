import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'creation_event.dart';
part 'creation_state.dart';

class CreationBloc extends Bloc<CreationEvent, CreationState> {
  CreationBloc() : super(CreationInitial()) {
    on<CreationEvent>((event, emit) async {
      if (event is SignEvent) {
        final auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('register_collection');
        print('sdfsdfsdgfsdfg');
        try {
          await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          await userRef.doc(auth.currentUser!.uid).set({
            'userid': auth.currentUser!.uid,
            'email': event.email,
            'second name': event.name,
            'password': event.password,
            'profileImage': '',
            'mobile': event.confirmPassword
          });
          emit(SignUpSucces());
        } on FirebaseAuthException catch (e) {
          emit(SignUpFailed(message: e.code));
        }
      }
    });
  }
}
