part of 'authentification_bloc.dart';

@immutable
abstract class AuthentificationEvent {}
class LoginEvent extends AuthentificationEvent{
LoginEvent({required this.email,required this.password});
String email;
String password;
}
