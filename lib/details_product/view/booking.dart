import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:phaarmy_user/bottum_navigat/bottum_navigat.dart';
import 'package:phaarmy_user/details_product/bloc/booking_bloc.dart';
// import 'package:vintagecars/dashboard/view/dashboard.dart';
// import 'package:vintagecars/electric_details/bloc/booking_bloc.dart';
// import 'package:vintagecars/register_page/bloc/register_bloc.dart';

class BookingPage extends StatefulWidget {
  BookingPage({super.key, required this.book});

  QueryDocumentSnapshot<Object?> book;

  State<BookingPage> createState() => _BookingPageState();
}

// List<String> list = <String>[
//   'Red',
//   'Blue',
//   'Black',
// ];
// String dropdownValue = list.first;
List<String> payment = <String>[
  'Cash on delivery',
  'Net banking',
  'UPI transaction',
];
String dropdownValueP = payment.first;
TextEditingController namecontroller = TextEditingController();
TextEditingController placecontroller = TextEditingController();
TextEditingController numbercontroller = TextEditingController();

final bookinghbloc = BookingBloc();

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bookinghbloc,
      child: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingAddSucess) {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => Dashboard(),
              ),
            );
            MotionToast.success(
              position: MotionToastPosition.top,
              //height: 100,
              // barrierColor: Colors.black,
              description: Text(
                'Booking Confirmed',
                style: GoogleFonts.abhayaLibre(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // primaryColor: Colors.red,
              // icon: Icons.done,
            ).show(context);
          } else if (state is BookingAddFiled) {
            MotionToast.error(
              position: MotionToastPosition.top,
              //height: 100,
              // barrierColor: Colors.black,
              description: Text(
                'Booking Cancelled',
                style: GoogleFonts.abhayaLibre(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // primaryColor: Colors.red,
              // icon: Icons.done,
            ).show(context);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'BOOKING',
              style: GoogleFonts.abel(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, right: 26),
                child: SizedBox(
                  height: 64,
                  child: Card(
                    shadowColor: Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 63, 61, 61),

                        //width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                            ),
                            child: Text(
                              // '',
                              widget.book['product'].toString(),
                              // book['driving_range'].toString(),
                              style: GoogleFonts.abhayaLibre(
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
                child: SizedBox(
                  height: 64,
                  child: Card(
                    shadowColor: Colors.redAccent,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 63, 61, 61)
                          //width: 2.0,
                          ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,

                    // const Color.fromARGB(255, 210, 212, 205),
                    child: Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                            ),
                            child: Text(
                              widget.book['price'].toString(),
                              style: GoogleFonts.abhayaLibre(
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
              //   child: SizedBox(
              //     height: 64,
              //     child: Card(
              //       shadowColor: Colors.redAccent,
              //       elevation: 0,
              //       shape: RoundedRectangleBorder(
              //         side: const BorderSide(
              //           color: Color.fromARGB(255, 247, 186, 182),
              //         ),
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       color: Colors.white,
              //       child: Column(
              //         children: [
              //           ListTile(
              //             title: Padding(
              //               padding: const EdgeInsets.only(
              //                 left: 2,
              //               ),
              //               child: DropdownButton<String>(
              //                 value: dropdownValue,
              //                 isExpanded: true,
              //                 icon: const Icon(
              //                   Icons.arrow_drop_down_sharp,
              //                   size: 30,
              //                 ),
              //                 elevation: 16,
              //                 style: GoogleFonts.abhayaLibre(
              //                   fontSize: 21,
              //                   fontWeight: FontWeight.w400,
              //                   color: Colors.black,
              //                 ),
              //                 onChanged: (String? value) {
              //                   setState(() {
              //                     dropdownValue = value!;
              //                   });
              //                 },
              //                 items: list.map<DropdownMenuItem<String>>(
              //                     (String value) {
              //                   return DropdownMenuItem<String>(
              //                     value: value,
              //                     child: Text(value),
              //                   );
              //                 }).toList(),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 26, right: 26, top: 10),
                child: SizedBox(
                  height: 64,
                  child: Card(
                    shadowColor: Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 63, 61, 61),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValueP,
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              ),
                              elevation: 16,
                              style: GoogleFonts.abhayaLibre(
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              onChanged: (String? valuee) {
                                setState(() {
                                  dropdownValueP = valuee!;
                                });
                              },
                              items: payment.map<DropdownMenuItem<String>>(
                                  (String valuee) {
                                return DropdownMenuItem<String>(
                                  value: valuee,
                                  child: Text(valuee),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 10,
                    ),
                    labelText: 'Your Name',
                    labelStyle: GoogleFonts.abel(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 63, 61, 61),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  controller: placecontroller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 10,
                    ),
                    labelText: 'Your Place',
                    labelStyle: GoogleFonts.abel(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 63, 61, 61),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  controller: numbercontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 10,
                    ),
                    labelText: 'Contact Number',
                    labelStyle: GoogleFonts.abel(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 63, 61, 61),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  bookinghbloc.add(
                    BookingAddEvent(
                      name: namecontroller.text,
                      place: placecontroller.text,
                      number: numbercontroller.text,
                      productName: widget.book['product'].toString(),
                      price: widget.book['price'].toString(),
                      fund: dropdownValueP,
                      image: widget.book['image'].toString(),
                    ),
                  );
                  namecontroller.clear();
                  placecontroller.clear();
                  numbercontroller.clear();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 47, right: 50, left: 50),
                  height: 55,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 61, 61),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Confirm Booking',
                          style: GoogleFonts.acme(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 19,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
