import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rebinnew/screens/donations_Page/read_data.dart';

class DonationsPage extends StatefulWidget {
  const DonationsPage({super.key});

  @override
  State<DonationsPage> createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  List<String> docIds = [];

  final user = FirebaseAuth.instance.currentUser;

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('donations')
        .where('email', isEqualTo: user!.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIds.add(document.reference.id);
          }),
        );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Donations',
          style: TextStyle(
            color: Color.fromARGB(248, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: FutureBuilder(
        future: getDocIds(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: docIds.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: GetQuantity(
                    documentId: docIds[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
