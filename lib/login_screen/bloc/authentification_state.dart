part of 'authentification_bloc.dart';

@immutable
abstract class AuthentificationState {}

class AuthentificationInitial extends AuthentificationState {}
class LoginSucces extends AuthentificationState {}

class Loginfaild extends AuthentificationState {
  Loginfaild({required this.message});
  String message;
}
 