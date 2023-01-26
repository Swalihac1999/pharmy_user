// ignore_for_file: prefer_const_constructors, unnecessary_const, use_decorated_box, prefer_const_literals_to_create_immutables, avoid_redundant_argument_values, lines_longer_than_80_chars, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:phaarmy/bottum_navigat/bottum_navigat.dart';
// import 'package:phaarmy/forgot_password/forgot_password.dart';
// import 'package:phaarmy/login_screen/bloc/authentification_bloc.dart';
// import 'package:phaarmy/sign_up/view/sign_up_page.dart';
// import 'package:phaarmy/home_page/homePage.dart';
import 'package:phaarmy_user/bottum_navigat/bottum_navigat.dart';
import 'package:phaarmy_user/forgot_password/forgot_password.dart';
import 'package:phaarmy_user/login_screen/bloc/authentification_bloc.dart';
import 'package:phaarmy_user/sign_up/sign_up_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _authbloc = AuthentificationBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _msize = MediaQuery.of(context).size.width;
    bool password = true;
    return BlocProvider(
      create: (context) => _authbloc,
      child: BlocListener<AuthentificationBloc, AuthentificationState>(
        listener: (context, state) {
          if (state is LoginSucces) {
            Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => Dashboard(),
                ));
          } else if (state is Loginfaild) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   colors: const [
                //     Color.fromARGB(255, 91, 195, 94),
                //     Colors.greenAccent
                //   ],
                // ),
                color: Color.fromARGB(255, 59, 108, 176),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pharmy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontStyle: FontStyle.italic,),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(73, 29, 29, 37),
                            blurRadius: 2000,
                            offset: Offset(0, 10),
                          )
                        ],
                        color: Color.fromARGB(255, 243, 240, 240),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(75, 54, 51, 49),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: mailController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintText: 'Email',
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: const Icon(Icons.person),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText: 'Passwrod',
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: const Icon(
                                                Icons.remove_red_eye,),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 175),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword(),
                                        ));
                                  },
                                  child: Text(
                                    'Forget Passwrod',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(221, 104, 102, 102)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {
                                  print('---------------------------');
                                  _authbloc.add(
                                    LoginEvent(
                                      email: mailController.text,
                                      password: passwordController.text,
                                    ),
                                  );

                                  // if (_formKey.currentState!.validate()) {

                                  // }
                                },
                                child: Text('Login'),
                                height: 60,
                                color:Color.fromARGB(255, 64, 117, 192),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: (_msize / 2) - 50,
                                      child: Divider()),
                                  Text('Or'),
                                  SizedBox(
                                      width: (_msize / 2) - 50,
                                      child: Divider()),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.facebook,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: FaIcon(FontAwesomeIcons.instagram),
                                      color: Color.fromARGB(255, 228, 45, 185),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Dont have an account?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUp(),
                                          ),);
                                    },
                                    child: Text('Sigh up'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // child: Column(
                      //   children: <Widget>[
                      //     Container(
                      //       padding: EdgeInsets.all(10),
                      //       decoration: BoxDecoration(
                      //         border: Border(
                      //             bottom: BorderSide(color: Colors.grey.shade200)),
                      //       ),
                      //       child: TextField(
                      //         decoration: InputDecoration(
                      //           hintText: "Email or Phone number",
                      //           hintStyle: TextStyle(color: Colors.grey),
                      //           // border: InputBorder.none,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
