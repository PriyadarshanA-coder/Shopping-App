import 'package:demo/apple_watch.dart';
import 'package:demo/puffer_jacket.dart';
import 'package:demo/unisex_hoodie.dart';
import 'package:demo/women_baggy.dart';
import 'package:flutter/material.dart';

class GirdItem extends StatefulWidget {
  const GirdItem({super.key});

  @override
  State<GirdItem> createState() => _GirdItemState();
}

class _GirdItemState extends State<GirdItem> {
  var pNames = [
    "Unisex Hoodie",
    "Puffer Jacket",
    "Apple Watch-M1",
    "Women Baggy Fit",
  ];

  var pPrices = ["\$150", "\$70", "\$200", "\$40"];

  var pPages = [UnisexHoodie(), PufferJacket(), AppleWatch(), WomenBaggy()];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.64,
        crossAxisCount: 2,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pPages[index]),
            );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFFFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "50% off",
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
                      "assets/img/${pNames[index]}.png",
                      height: 180,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pNames[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pPrices[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.redAccent,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "50% off",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
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
    );
  }
}
