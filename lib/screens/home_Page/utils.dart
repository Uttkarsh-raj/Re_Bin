import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 100,
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(18),
                ),
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.height * 0.09,
                child: Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.red[400],
                ),
              ),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Favorites',
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 2, 42),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShortContainer extends StatelessWidget {
  const ShortContainer({
    super.key,
    required this.icon,
    required this.label,
  });
  final icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.35,
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 12),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.height * 0.10,
              child: icon,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.height * 0.13,
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 26, 31, 22),
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 10, 8),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
