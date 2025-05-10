import 'package:demo/register_page.dart';
import 'package:demo/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:softBeige,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Lottie.asset(
                  'assets/img/lottie.json',
                  fit: BoxFit.fill,
                  frameRate: FrameRate.composition,
                  controller: _controller,
                ),
              ),
            ),

            SizedBox(height: 50),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Wear Your Style",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Discover the latest fashion for Men, & Women",
                  style: GoogleFonts.inter(fontSize: 15),
                ),
                Text(
                  "all in one place - Fast Delivery,easy returns",
                  style: GoogleFonts.inter(fontSize: 15),
                ),
                Text(
                  "and styles for every season.",
                  style: GoogleFonts.inter(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 50),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child:   Container(
                      height: 70,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(child: Text(
                        'Register',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                  ),
                  ),
                SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child:  Container(
                      height: 70,
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(child:
                      Text('SignIn',
                        style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
