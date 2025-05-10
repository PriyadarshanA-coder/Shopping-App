import 'package:demo/griditem.dart';
import 'package:demo/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}
final user= FirebaseAuth.instance.currentUser;

void signUserOut(){
  FirebaseAuth.instance.signOut();
}

class _AllState extends State<All> with TickerProviderStateMixin {
  
  final searchController = TextEditingController();
  
  late final AnimationController _controller1;
  late final AnimationController _controller2;

  final Color softBeige = Color(0xFFFDF6EC);

  @override
  void initState() {
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    )..repeat();
    super.initState();
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  var pNames = ["Unisex Hoodie", "Puffer Jacket", "Nike Sneaker", "Baggy Pant"];

  var pPrices = ["\$50", "\$70", "\$200", "\$30"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body section
      backgroundColor:softBeige,
      body: ListView(
        children: [
          Search(
              controller: searchController,
              hinText: 'Search..',
              suffixIcon: Icons.search,
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Container(
                child: Lottie.asset(
                  'assets/img/sales.json',
                  height: 200,
                  frameRate: FrameRate(90),
                  controller: _controller2,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          // Text
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("See All"),
              ],
            ),
          ),
          GirdItem(),
        ],
      ),
    );
  }
}
