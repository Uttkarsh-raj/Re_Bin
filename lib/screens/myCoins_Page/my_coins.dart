import 'package:flutter/material.dart';

class MyCoinsPage extends StatefulWidget {
  const MyCoinsPage({super.key});

  @override
  State<MyCoinsPage> createState() => _MyCoinsPageState();
}

class _MyCoinsPageState extends State<MyCoinsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Re-Bin Coin',
          style: TextStyle(
            color: Color.fromARGB(248, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Image.asset(
                          'assets/images/Rebin_Coin_1.png',
                          scale: 5,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 85,
                      bottom: 0,
                      left: 173,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                        child: Center(
                          child: Text(
                            '+50',
                            style: TextStyle(
                              color: Color.fromARGB(255, 26, 31, 22),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                  child: Center(
                    child: Text(
                      'Every Family, Restaurant, Food Outlet, Grocery store produces large amount of left overs, stale foods and other food waste on a daily basis which is hazardous if left unnoticed. These leftovers can be donated to the unprivileged whereas non edible wastes can be disposed to form compost.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 31, 22),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                  child: Center(
                    child: Text(
                      'ReBin enables people to safely donate their food waste which will go into a good cause of feeding people and also providing compost for agricultural sector.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 31, 22),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                  child: Center(
                    child: Text(
                      'For every donation you get reward points in the form of Re-Bin coin which can be exchanged in return of different rewards.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 31, 22),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 0, 20),
                  child: Center(
                    child: Text(
                      'Continue donating for the greater cause and dont forget to claim your rewards. Thank you for your contribution.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 31, 22),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
