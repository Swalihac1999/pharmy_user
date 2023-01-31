// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, inference_failure_on_instance_creation, sort_child_properties_last, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:phaarmy_user/login/login.dart';
import 'package:phaarmy_user/login_screen/login_dcreen.dart';
import 'package:phaarmy_user/sign_up/bloc/creation_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _regBloc = CreationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _regBloc,
      child: BlocListener<CreationBloc, CreationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 105, 230, 109),
                // gradient: LinearGradient(
                //   colors: const [
                //     Color.fromARGB(255, 91, 195, 94),
                //     Colors.greenAccent
                //   ],
                // ),
              ),
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(73, 29, 29, 37),
                            blurRadius: 2000,
                            offset: Offset(0, 10),
                          ),
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
                                        validator: (value) {
                                          if (value!.length <= 4) {
                                            return 'name should be atleast 4 charecter';
                                          }
                                          print('value');
                                        },
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintText: "Email",
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: const Icon(Icons.person),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintText: "name",
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: const Icon(Icons.person),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintText: "Password",
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: const Icon(Icons.person),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: confirmpasswordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          hintText: "Confirm Password",
                                          filled: true,
                                          fillColor: Colors.white,
                                          suffixIcon: const Icon(Icons.person),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) ;
                                  _regBloc.add(SignEvent(
                                    userName:usernameController.text,
                                      email: emailController.text,
                                      name: nameController.text,
                                      password: passwordController.text,
                                      confirmPassword:confirmpasswordController.text,),);
                                },
                                
                                child: Text('Login'),
                                height: 60,
                                color: Color.fromARGB(255, 105, 230, 109),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),

                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an accound.'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text('Login'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
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
