import 'package:demo/pass_textfield.dart';
import 'package:demo/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ChangePass extends StatefulWidget {
  const ChangePass ({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass>
    with TickerProviderStateMixin {
  final Color softBeige = Color(0xFFFDF6EC);

  final currentPassController = TextEditingController();

  final newPassController = TextEditingController();

  final confirmPassController = TextEditingController();

  late final AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync:this,
    duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose(){
    controller.dispose();
    currentPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBeige,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 10),
                child: IconButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage(),),);
                    },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text('Change password',style: GoogleFonts.urbanist(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ],
            ),

            // 1st
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text('Current password',style: GoogleFonts.urbanist(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ],
            ),
            SizedBox(height: 10),
            PassTextfield(
              controller: currentPassController,
              hintText: 'Current Password',
              obscureText: true,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
            ),

            //2nd
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text('New Password',style: GoogleFonts.urbanist(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ],
            ),
            SizedBox(height: 10),
            PassTextfield(controller: newPassController,
              hintText: 'New Password',
              obscureText: true,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
            ),

            //3rd
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text('Confirm Password',style: GoogleFonts.urbanist(fontSize: 18,fontWeight: FontWeight.bold),),
                )
              ],
            ),
            SizedBox(height: 10),
            PassTextfield(controller: confirmPassController,
              hintText: 'Confirm Password',
              obscureText: true,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
            ),

            SizedBox(height: 30),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 25.0),
                child: GestureDetector(
                  onTap: (){
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                  color: Colors.white,
                                    child: Lottie.asset(
                                      'assets/img/Success.json',
                                      controller: controller,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Password Changed!',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Your password has been successfully changed.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                  ),
                                  SizedBox(height: 25),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.redAccent,
                                      ),
                                      child: Center(
                                        child: Text(
                                            'Continue',
                                          style: GoogleFonts.urbanist(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ),
                      );
                    },
                  child: Container(
                    height: 60,
                    width: 360,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Text('Change Password',
                        style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
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