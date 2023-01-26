import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  AuthentificationBloc() : super(AuthentificationInitial()) {
    on<AuthentificationEvent>((event, emit) async {
      if (event is LoginEvent) {
        print('+================================');
        final _auth = FirebaseAuth.instance;
        try {
          await _auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSucces());
        } on FirebaseAuthException catch (e) {
          emit(Loginfaild(message: e.code));
        }
      }
    });
  }
}
