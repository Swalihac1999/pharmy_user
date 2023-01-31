import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phaarmy_user/bottum_navigat/bottum_navigat.dart';
import 'package:phaarmy_user/home_page/homePage.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});

  final bookingg = FirebaseFirestore.instance.collection('booking_collection');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),),);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 19,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: bookingg
            .where('user_id', isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bookingview = snapshot.data!.docs;
            return ListView.builder(
              itemCount: bookingview.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  height: 200,
                  width: 40,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 140,top: 3 ),
                        child: Image.network(
                          bookingview[index]['image'].toString(),
                          height: 70,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 80),
                            child: Text(
                              bookingview[index]['product'].toString(),
                              style: GoogleFonts.alumniSans(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 4, 170, 7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Center(
                              child: Text(
                                bookingview[index]['price'].toString(),
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 59, 108, 176),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'BOOKED',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}