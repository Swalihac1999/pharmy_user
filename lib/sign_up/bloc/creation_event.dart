part of 'creation_bloc.dart';

@immutable
abstract class CreationEvent {}
class SignEvent extends CreationEvent {
  SignEvent({
    required this.email,
       required this.userName,
    required this.name,
    required this.password,
    required this.confirmPassword,
  });
  String email;
  String userName;
  String name;
  String password;
  String confirmPassword;
}
