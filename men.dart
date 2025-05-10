import 'package:demo/baggy_pant.dart';
import 'package:demo/black_sweatshirt.dart';
import 'package:demo/headphones.dart';
import 'package:demo/nike_sneaker.dart';
import 'package:flutter/material.dart';

class Men extends StatefulWidget {
  const Men({super.key});

  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> {
  var pNames1 = [
    "Black Sweatshirt",
    "Baggy Pant",
    "Headphones",
    "Nike Sneaker",
  ];

  final Color softBeige = Color(0xFFFDF6EC);

  var pPrice1 = ["\$50", "\$100", "\$70", "\$200"];

  var pPages1 = [BlackSweatshirt(), BaggyPant(), Headphones(), NikeSneaker()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:softBeige,
      //body section
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrivals",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("See all"),
              ],
            ),
          ),

          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.64,
            ),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pPages1[index]),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2,
                        blurRadius: 4,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "30% off",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.redAccent),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/img/${pNames1[index]}.png",
                            height: 180,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pNames1[index],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pPrice1[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "30% off",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
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
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
