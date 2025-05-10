import 'package:demo/my_textfield1.dart';
import 'package:demo/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:softBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/img/Register.json',
                fit: BoxFit.contain,
                // height: 250, // Set a fixed height for the animation
                frameRate: FrameRate.composition,
                controller: _controller,
              ),
              SizedBox(height: 10),
              Text(
                "Create Account",
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Ready to elevate your wardrobe? Sign Up",
                style: GoogleFonts.inter(fontSize: 15, color: Colors.grey[700]),
              ),
              Text(
                "and step into the latest trends",
                style: GoogleFonts.inter(fontSize: 15, color: Colors.grey[700]),
              ),

              SizedBox(height: 40),
              // 1st
              MyTextfield1(
                controller: usernameController,
                obscureText: false,
                hinText: 'Full name',
                  prefixIcon: Icons.person,
              ),
              SizedBox(height: 20),
              //2nd
              MyTextfield1(
                controller: emailController,
                obscureText: false,
                hinText: 'Email Address',
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 20),
              // 3rd
              MyTextfield1(
                controller: passwordController,
                obscureText: true,
                hinText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
              SizedBox(height: 20),
              // 4rd
              MyTextfield1(
                controller: confirmPasswordController,
                obscureText: true,
                hinText: 'Confirm Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
              SizedBox(height: 40),

              GestureDetector(
                onTap: () async {
                  String username = usernameController.text.trim();
                  String mail = emailController.text.trim();
                  String pass = passwordController.text.trim();
                  String confirm = confirmPasswordController.text.trim();

                  if (username.isEmpty || mail.isEmpty || pass.isEmpty || confirm.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  if (pass != confirm) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Passwords do not match')),
                    );
                    return;
                  }

                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: mail,
                      password: pass,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Registered Successfully")),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${e.toString()}")),
                    );
                    print("Error: $e");
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
                      "Sign Up",
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
                      "Or Conitnue with",
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
                    "Already have an Account?",
                    style: GoogleFonts.urbanist(),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.urbanist(color: Colors.blue.shade600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
