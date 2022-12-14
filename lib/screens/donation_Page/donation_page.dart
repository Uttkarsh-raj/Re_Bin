import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

final user = FirebaseAuth.instance.currentUser;

class _DonationPageState extends State<DonationPage> {
  String dropDownValue = 'Commodities';
  String dropDownValue1 = 'Action';
  String datetime = DateTime.now().toString();
  final TextEditingController control = TextEditingController();

  var comodits = [
    'Commodities',
    'Stale Food(<1day)',
    'Stale Food(>1day)',
    'Plastic Bottles',
  ];

  var action = [
    'Action',
    'Donation',
    'Composting',
    'Recycle',
  ];

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  Future donate(int n) async {
    donationDetails(datetime, user?.uid, user?.email, int.parse(control.text),
        dropDownValue, dropDownValue1, n);
  }

  Future donationDetails(String dateTime, String? uid, String? email,
      int quantity, String commodity, String action, int n) async {
    await FirebaseFirestore.instance.collection('donations').add({
      'D & T': datetime,
      'uid': uid,
      'email': email,
      'quantity': quantity,
      'commodity': commodity,
      'action': action,
      'points': n,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Donate',
          style: TextStyle(
            color: Color.fromARGB(248, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 10, 10, 0),
              child: Image.asset(
                'assets/images/foodtasting_transparent_background_cropped.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        width: 3,
                        color: const Color.fromRGBO(102, 187, 106, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 6, 8, 8),
                      child: Row(
                        children: [
                          const Center(
                            child: Text(
                              'Qty  :',
                              style: TextStyle(
                                color: Color.fromARGB(255, 141, 129, 140),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: TextField(
                                controller: control,
                                decoration: const InputDecoration(
                                    hintText: 'Enter the quantity',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 141, 129, 140),
                                      fontSize: 18,
                                    ),
                                    border: InputBorder.none),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.number,
                                expands: false,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 141, 129, 140),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        width: 3,
                        color: const Color.fromRGBO(102, 187, 106, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 6, 8, 8),
                      child: Row(
                        children: [
                          const Center(
                            child: Text(
                              'Comm :',
                              style: TextStyle(
                                color: Color.fromARGB(255, 141, 129, 140),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.51,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: dropDownValue,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                  ),
                                  items: comodits.map((String comodits) {
                                    return DropdownMenuItem(
                                      value: comodits,
                                      child: Text(
                                        comodits,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 141, 129, 140),
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(
                        width: 3,
                        color: const Color.fromRGBO(102, 187, 106, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 6, 8, 8),
                      child: Row(
                        children: [
                          const Center(
                            child: Text(
                              'Action:',
                              style: TextStyle(
                                color: Color.fromARGB(255, 141, 129, 140),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.51,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: dropDownValue1,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                  ),
                                  items: action.map((String action) {
                                    return DropdownMenuItem(
                                      value: action,
                                      child: Text(
                                        action,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 141, 129, 140),
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownValue1 = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (dropDownValue != 'Commodities' &&
                          dropDownValue1 != 'Action') {
                        if (dropDownValue == 'Stale Food(<1day)') {
                          donate(5);
                          showCustomDialog(context);
                        } else if (dropDownValue == 'Stale Food(>1day)') {
                          donate(4);
                          showCustomDialog(context);
                        } else if (dropDownValue == 'Plastic Bottles') {
                          donate(2 * (int.parse(control.text)));
                          showCustomDialog(context);
                        }
                      } else {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Please fill the above data properly.',
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 26, 31, 22),
                          action: SnackBarAction(
                            label: 'dismiss',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 115, 211, 120),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x413A5160),
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 131, 245, 137),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Donate',
                          style: TextStyle(
                            color: Color.fromARGB(248, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Scaffold(
                body: Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Thank You',
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 31, 22),
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Lottie.network(
                            'https://assets2.lottiefiles.com/datafiles/3RKIaYNZqu6RrV0/data.json',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                'We appreciate your help in this noble cause. Thank you so much for this.You have earnerd  credit.',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 26, 31, 22),
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
