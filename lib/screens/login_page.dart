import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() async {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Hello User!!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome back, you are great!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(height: 20),

                //E-MAIL FIELD

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'E-mail',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //PASSWORD FIELD

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                //SIGN IN BUTTON

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    height: 60,
                    width: 300,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                //REGISTER TEXT

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Not a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(' Register today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                  ],
                ),

                const SizedBox(height: 20),

                //IMAGES
                Image.asset(
                  'assets/images/food.png',
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10),

                //LOGO

                Image.asset(
                  'assets/images/TLogo.png',
                  width: 350,
                  height: 70,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
