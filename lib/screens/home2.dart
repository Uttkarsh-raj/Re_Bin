import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rebinnew/screens/donation_page.dart';
import 'package:rebinnew/screens/utils.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(102, 187, 106, 1),
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(102, 187, 106, 1),
                  backgroundBlendMode: BlendMode.lighten,
                ),
                accountName: Text(
                  'Hello ${user?.displayName ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
                accountEmail: Text('${user?.email}'),
                currentAccountPictureSize: const Size.square(45),
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
      backgroundColor: const Color.fromARGB(255, 250, 250, 245),
      body: CustomScrollView(
        slivers: [
          // Sliver App Bar
          SliverAppBar(
            collapsedHeight: 57,
            centerTitle: true,
            title: const Text(
              'Re-Bin',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(241, 250, 250, 255),
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.33,
            pinned: true,
            backgroundColor: Colors.green[400],
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  //SLIVERAPP BAR TEXT
                  Container(
                    color: Colors.green[400],
                    height: MediaQuery.of(context).size.height * 0.14,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Your move to make... \nsomeones life better...',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromARGB(248, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Welcome Back',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromARGB(248, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),

          //Sliver Items

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 250, 250, 245),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0x413A5160),
                            offset: Offset(1.1, 1.1),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DonationPage(),
                                ),
                              );
                            },
                            child: ShortContainer(
                              label: 'Donate',
                              icon: Image.asset('assets/icons/donation.png'),
                            ),
                          ),
                          ShortContainer(
                            label: 'Redeem',
                            icon: Image.asset('assets/icons/buy.png'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ShortContainer(
                            label: 'Favorite',
                            icon: Icon(
                              Icons.favorite,
                              size: 70,
                            ),
                          ),
                          ShortContainer(
                            label: 'Favorite',
                            icon: Icon(
                              Icons.favorite,
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomContainer(),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: const [
                ShortContainer(
                  label: 'Favorite',
                  icon: Icon(
                    Icons.favorite,
                    size: 70,
                  ),
                ),
                ShortContainer(
                  label: 'Favorite',
                  icon: Icon(
                    Icons.favorite,
                    size: 70,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
