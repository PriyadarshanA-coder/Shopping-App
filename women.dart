import 'package:demo/baggy_denim.dart';
import 'package:demo/converse_cdg.dart';
import 'package:demo/crop_top.dart';
import 'package:demo/women_fullskirt.dart';
import 'package:flutter/material.dart';

class Women extends StatefulWidget {
   Women({super.key});


  @override
  State<Women> createState() => _WomenState();
}
  final Color softBeige = Color(0xFFFDF6EC);


class _WomenState extends State<Women> {
  var pNames2 = [
    "Crop Tops",
    "Baggy Denim",
    "Women Full Skirts",
    "Converse Cdg",
  ];

  var pPrice2 = ["\$50", "\$100", "\$150", "\$400"];

  var pPages2 = [CropTop(), BaggyDenim(), WomenSkirt(), ConverseCdg()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBeige,
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
              childAspectRatio:0.64,
            ),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pPages2[index]),
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
                              "20% off",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.redAccent),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/img/${pNames2[index]}.png",
                            height: 180,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pNames2[index],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pPrice2[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "20% off",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black54,
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
