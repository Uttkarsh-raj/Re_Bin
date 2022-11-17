import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetQuantity extends StatelessWidget {
  const GetQuantity({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference donations =
        FirebaseFirestore.instance.collection('donations');

    return FutureBuilder<DocumentSnapshot>(
      future: donations.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    'Quantity:\n${data['quantity']}' +
                        '\t\n' +
                        'Commodity:\n${data['commodity']}' +
                        '\t\n' +
                        'Action:\n${data['action']}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 26, 31, 22),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/Rebin_Coin_1.png',
                        scale: 6,
                      ),
                    ),
                    const Text(
                      '+5',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 31, 22),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return const Text('Loading...');
      },
    );
  }
}

class GetAction extends StatelessWidget {
  const GetAction({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference donations =
        FirebaseFirestore.instance.collection('donations');

    return FutureBuilder<DocumentSnapshot>(
      future: donations.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Action:${data['action']}');
        }
        return const Text('Loading...');
      },
    );
  }
}

class GetCommodity extends StatelessWidget {
  const GetCommodity({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference donations =
        FirebaseFirestore.instance.collection('donations');

    return FutureBuilder<DocumentSnapshot>(
      future: donations.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Commodity:${data['commodity']}');
        }
        return const Text('Loading...');
      },
    );
  }
}
