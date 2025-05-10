import 'package:demo/homepage.dart';
import 'package:demo/my_textfield.dart';
import 'package:demo/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Color softBeige = Color(0xFFFDF6EC);


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:softBeige,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/img/SignIn.json',
                  fit: BoxFit.contain,
                  // height: 250, // Set a fixed height for the animation
                  frameRate: FrameRate.composition,
                  controller: _controller,
                ),
                Text(
                  "Hello Again!",
                  style: GoogleFonts.urbanist(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome back you've",
                  style: GoogleFonts.urbanist(fontSize: 25),
                ),
                Text(
                  "been  missed!",
                  style: GoogleFonts.urbanist(fontSize: 25),
                ),
                SizedBox(height: 30),
                MyTextfield(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 20),
                MyTextfield(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Recovery Password")],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {

                    String mail = emailController.text.trim();
                    String pass = passwordController.text.trim();

                    if(mail.isEmpty || pass.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter All The Text Fields')));
                      return;
                    }
                      try{
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: pass).then((value){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged In SuccessFully")));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                        });
                      }catch(er){
                        print('er');
                      }

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent,
                    ),
                    height: 60,
                    width: 360,
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or conitnue with",
                        style: GoogleFonts.urbanist(),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset("assets/img/Google Logo.png"),
                    ),
                    SizedBox(width: 30),
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset("assets/img/Apple Logo.png"),
                    ),
                    SizedBox(width: 30),
                    Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset("assets/img/Facebook Logo.webp"),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: GoogleFonts.urbanist(),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Register now",
                        style: GoogleFonts.urbanist(
                          color: Colors.blue.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
