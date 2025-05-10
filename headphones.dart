import 'package:demo/product.dart';
import 'package:demo/women.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Headphones extends StatefulWidget {
  const Headphones({super.key});

  @override
  State<Headphones> createState() => _HeadphonesState();
}

class _HeadphonesState extends State<Headphones> {
  Color iconColor = Colors.white;

  void changeColor() {
    setState(() {
      // ternary operator
      //condition               //May be ?  // true    // false
      iconColor = iconColor == Colors.white ? Colors.redAccent : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBeige,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Color(0xFFCBBFAD),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new, size: 25),
                    ),
                  ),
                  Center(
                    child: ImageSlideshow(
                      indicatorColor: Colors.orangeAccent,
                      indicatorBackgroundColor: Colors.white,
                      height: 300,
                      indicatorRadius: 5,
                      isLoop: true,
                      autoPlayInterval: 3000,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                          child: Image.asset("assets/img/Headphones.png",fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                          child: Image.asset("assets/img/earphone.png",fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                          child: Image.asset("assets/img/Headphones.png",fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                          child: Image.asset("assets/img/earphone.png",fit: BoxFit.contain),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 340),
                      GestureDetector(
                        onTap: changeColor,
                        child: Icon(Icons.favorite, color: iconColor),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Text(
                        "OverEar Headphones",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "\$70",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "\$100",
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        "Experience immersive audio with our OverEar Headphone"
                        "for exceptional sound clarity deep bass "
                        "and all day comfort in a sleek design",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Text(
                        "Colors",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 135),
                      Text(
                        "Size",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  //Colors
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 40,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 40,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.purpleAccent,
                        ),
                      ),

                      // size
                      SizedBox(width: 20),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: Text(
                          "XS",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: Text(
                          "S",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: Text(
                          "M",
                          style:GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final cart = Provider.of<Shop>(
                            context,
                            listen: false,
                          );
                          cart.addToCart(
                            Product(
                              name: "OverEar Headphones",
                              price: "\$70",
                              imagePath: "assets/img/Headphones.png",
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to cart!')),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_bag_outlined, size: 25),
                                SizedBox(width: 5),
                                Text(
                                  "ADD TO CART",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
