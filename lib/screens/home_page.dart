import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Bin'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 70.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        elevation: 1.00,
        backgroundColor: Colors.green[400],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(100, 181, 246, 1),
                    Color.fromRGBO(102, 187, 106, 1)
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(102, 187, 106, 1),
                  backgroundBlendMode: BlendMode.lighten,
                ),
                accountName: const Text(
                  'Hello',
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text('$user.email'),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 10,
            ),
            Card(
              shadowColor: Colors.green,
              elevation: 9.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 135, 210, 138),
                      Color.fromARGB(255, 107, 168, 218),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '0 \n Credits',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 12,
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('SignOut'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
